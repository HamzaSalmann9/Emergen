import 'dart:convert';

import 'network.dart';
import 'models/product_response.dart';
import 'package:get/get.dart';

import 'controllers/filters_controller.dart';

class Repository {
  Network network = Network();
  final FiltersController controller = Get.put(FiltersController());

  Future<void> getGenres() async {
    var response = await network.getGenres();

    if (response != null) {
      var jsonResponse = json.decode(response);
      List<dynamic> genreList = jsonResponse['result']['data'];
      List<Genre> genres = genreList.map((e) => Genre.fromJson(e)).toList();
      controller.genres = genres;
    }
  }

  Future<void> getPlatforms() async {
    var response = await network.getPlatforms();

    if (response != null) {
      var jsonResponse = json.decode(response);
      List<dynamic> platformList = jsonResponse['result']['data'];
      List<Platform> platforms =
          platformList.map((e) => Platform.fromJson(e)).toList();
      controller.platforms = platforms;
    }
  }

  Future<void> getRegions() async {
    var response = await network.getRegions();

    if (response != null) {
      var jsonResponse = json.decode(response);
      List<dynamic> regionList = jsonResponse['result']['data'];
      List<Region> regions = regionList.map((e) => Region.fromJson(e)).toList();
      controller.regions = regions;
    }
  }

  Future<void> getTags() async {
    var response = await network.getTags();

    if (response != null) {
      var jsonResponse = json.decode(response);
      List<dynamic> tagList = jsonResponse['result']['data'];
      List<Tag> tags = tagList.map((e) => Tag.fromJson(e)).toList();
      controller.tags = tags;
    }
  }
}
