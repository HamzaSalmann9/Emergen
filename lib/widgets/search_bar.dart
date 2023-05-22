import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart' as EmergenSearchController;

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.white,
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 18,
            child: VerticalDivider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search your favorite game here...",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white,
              ),
              onSubmitted: (_) {
                EmergenSearchController.SearchController.getProducts(
                  title: searchController.text.isNotEmpty
                      ? searchController.text
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
