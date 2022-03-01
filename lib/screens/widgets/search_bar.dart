import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/directory_controller.dart';

class SearchBar extends StatelessWidget {
  final dc = Get.find<DirectoryController>();

  final void Function(String)? onChanged;

  SearchBar({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 18, right: 18, top: 15, bottom: 5),
      child: TextField(
        controller: dc.txControl.value,
        onTap: () {
          // _dC.searched.value = false;
        },
        onEditingComplete: () async {
          print(dc.txControl.value.text);
          if (dc.txControl.value.text.isNotEmpty) {
            dc.isLoading.value = true;
            dc.fetchArticles(dc.txControl.value.text);
            // dc.moreCourse.value = true;
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
    filled: true,
    fillColor: Color.fromRGBO(241, 242, 244, 1),
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 0.2, color: Color.fromRGBO(220, 221, 225, 1)),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.2, color: Color.fromRGBO(220, 221, 225, 1)),
      borderRadius: BorderRadius.circular(5),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.2, color: Color.fromRGBO(220, 221, 225, 1)),
      borderRadius: BorderRadius.circular(5),
    ),
    contentPadding: EdgeInsets.only(
        top: MediaQuery.of(context).size.shortestSide < 600 ? 5 : 20,
        bottom: MediaQuery.of(context).size.shortestSide < 600 ? 5 : 20,
        left: 20,
        right: 10),
    hintText: "Search article",
    hintStyle: TextStyle(
        color: Color.fromRGBO(90, 92, 96, 1),
        fontSize: MediaQuery.of(context).size.shortestSide < 600 ? 14 : 25),
    // prefixIcon: IconButton(
    //   icon: Icon(Icons.arrow_back),
    //   onPressed: () => Get.back(),
    //   color: Color.fromRGBO(8, 114, 199, 1),
    //   iconSize: MediaQuery.of(context).size.shortestSide < 600 ? 24 : 30,
    // ),
    // suffixIcon: IconButton(
    //   icon: Icon(FontAwesomeIcons.times, size: 18),
    //   onPressed: () {
    //     // _directoryController.firstInit.value = true;
    //     // controller!.clear();
    //     FocusScope.of(context).unfocus();
    //   },
    //   color: kNewBlack2a,
    // ),
  ),
      ),
    );
  }
}
