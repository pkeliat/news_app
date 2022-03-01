import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/directory_controller.dart';
import 'package:news_app/screens/widgets/card_result.dart';
import 'package:news_app/screens/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  final dc = Get.put(DirectoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: SafeArea(
            child: Obx(
          () => dc.isLoading.value == true
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  controller: dc.controller,
                  child: Column(
                    children: [
                      SearchBar(
                        onChanged: (value){
                          
                        },
                      ),
                      Obx(
                        () => ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: dc.total.value,
                            itemBuilder: (context, index) {
                              return CardsResult(index: index);
                            }),
                      ),
                    ],
                  )),
        )));
  }
}
