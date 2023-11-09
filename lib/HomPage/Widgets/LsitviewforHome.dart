import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Controllers/Postcontroller.dart';
import '../../Postdetails.dart';

class MyListViewWidget extends StatelessWidget {
  final postcontroller PostController = Get.find<postcontroller>();

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      print(PostController.PostList.toJson());

      if (PostController.PostList.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Container(

          child: Expanded(
            child: ListView.builder(
              shrinkWrap: true,

              itemCount: PostController.PostList.length,

              itemBuilder: (context, index) {
                final post = PostController.PostList[index];
                print(PostController.PostList.length.toString());

                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    /* height: screenHeight*.500,*/
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: Color(
                            0x00000029),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(
                              0x29000000),
                          offset: Offset(5.0, 5.0), //(x,y)
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("lib/Assets/postimage.jpg"),
                          SizedBox(height: 3),
                          Text(
                            "Content ID:" + post.id.toString(),
                            style: TextStyle(
                                color: Color(0xFF7F7F7F), fontSize: 18),
                          ),
                          SizedBox(height: 3),
                          Text(
                            post.title.toString(),
                            style: const TextStyle(
                                color: Color(0xFF222221),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "User ID:" + post.userId.toString(),
                            style: TextStyle(
                                color: Color(0xFFD20073),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFD20073),
                                ),
                                child: TextButton(
                                  onPressed: () {

                                    Get.to(PostDetailsPage(post: post,));

                                  },
                                  child: Text(
                                    "Read",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFFD20073)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    });
  }
}
