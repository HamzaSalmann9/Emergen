import 'package:get/get.dart';

import 'filters_controller.dart';
import '../network.dart';

class SearchController {
  static getProducts({String? title}) async {
    final FiltersController filtersController = Get.put(FiltersController());
    await Network.fetchProducts(
      genre: filtersController.selectedGenre,
      tags: filtersController.selectedTag,
      platform: filtersController.selectedPlatform,
      title: title,
    );
  }
}
