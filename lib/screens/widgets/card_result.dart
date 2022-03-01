import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/directory_controller.dart';
import 'package:news_app/models/directory.dart';
import 'package:news_app/screens/widgets/web_view.dart';

class CardsResult extends StatelessWidget {
  final dc = Get.find<DirectoryController>();
  int index;

  CardsResult({required this.index});

  @override
  Widget build(BuildContext context) {
    Article artikel = dc.direktori.value.articles![index];
    return GestureDetector(
      onTap: () {
        print('pressed $index');
        dc.detailUrl.value = artikel.url!;
        dc.detailTitle.value = artikel.title!;
        Get.to(() => WebViewDetail());
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              artikel.urlToImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(26),
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      child: Image.network(
                        artikel.urlToImage!,
                        // placeholder: (context, _) =>
                        //     Container(color: Colors.grey[200], width: 92, height: 92),
                        width: Get.size.width,
                        height: 100,
                        fit: BoxFit.cover,
                        //             child: Image.network(
                        // width: 92,
                        // height: 92,
                        // fit: BoxFit.fill,
                        // ),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  artikel.title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),

              // author and source
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      artikel.source!.name!,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    artikel.author != null
                        ? Text(
                            artikel.author!,
                            style: TextStyle(
                                fontSize: 11,
                                // fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          )
                        : Container()
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  // removing Read more text
                  artikel.description!.replaceAll("Read more", ""),
                  style: TextStyle(),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Read More',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
