import '../models/product_response.dart';
import '../controllers/products_controller.dart';
import '../repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/filters_controller.dart';
import 'filter.dart';
import '../widgets/search_bar.dart';
import '../widgets/bottom_navbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  final ProductsController productsController = Get.put(ProductsController());
  final FiltersController filtersController = Get.put(FiltersController());

  @override
  void initState() {
    super.initState();
    getFilters();
  }

  Future<void> getFilters() async {
    Repository repository = Repository();

    List<Future> futures = [
      repository.getGenres(),
      repository.getPlatforms(),
      repository.getRegions(),
      repository.getTags(),
    ];

    await Future.wait<dynamic>(futures);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x00152245),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CustomWidget(),
              SearchBarWidget(searchController: searchController),
              Expanded(
                child: Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: productsController.products.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        product: productsController.products[index],
                      );
                    },
                  ),
                ),
              ),
              BottomNav(),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomWidget() {
    return Row(
      children: [
        const Text(
          "Search",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        const Spacer(),
        InkWell(
          child: const Text(
            "Filter",
            style: TextStyle(color: Colors.orange, fontSize: 16),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilterScreen()),
          ),
        ),
      ],
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      height: 224,
      width: 150,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 110,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    const Color(0x00152245),
                    Colors.grey.withOpacity(0.6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Container(
                width: 145,
                height: 105,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.black,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      product.type,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 14,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.genre.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF316BFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 4.0,
                            ),
                            child: Text(
                              product.genre[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              product.image,
              height: 120,
              width: 140,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
