import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/directory.dart';
import 'package:http/http.dart' as http;

class DirectoryController extends GetxController {
  var txControl = TextEditingController().obs;

  // var totalArticle = 0.obs;
  var direktori = Directory().obs;
  var detailUrl = ''.obs;
  var detailTitle = ''.obs;
  var total = 5.obs;
  var plus = 5.obs;
  var isLoading = false.obs;
  ScrollController? controller;

  @override
  void onInit() async {
    super.onInit();
    fetchArticles('tesla');
    controller = ScrollController();
    controller!.addListener(_scrollListener);
  }

// fetch artikel by keywords
  Future<void> fetchArticles(String? keywords) async {
    try {
      isLoading.value = true;
      final respon = await http
          .get(Uri.parse('$baseUrl/everything?q=$keywords&apiKey=$apiKey'));
      direktori.value = directoryFromJson(respon.body);
      print(direktori.value.articles![0].content);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

// scroll listener
  _scrollListener() {
    if (controller!.position.pixels == controller!.position.maxScrollExtent) {
      if (total.value != direktori.value.articles!.length - 1)
        total.value += plus.value;
    }
  }
}
