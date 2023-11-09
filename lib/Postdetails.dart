import 'package:flutter/material.dart';

import 'Modelclasses/PostModel.dart';

class PostDetailsPage extends StatelessWidget {
  final postemodel  post;

  PostDetailsPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Container(

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
                    0x29000000), //
                offset: Offset(5.0, 5.0), //(x,y)
                blurRadius: 8.0,
              ),
            ],
          ),




        child: Expanded(
          child: Container(
            decoration: BoxDecoration(

              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(
                      0x29000000), //
                  offset: Offset(5.0, 5.0), //(x,y)
                  blurRadius: 8.0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage('lib/Assets/Bkgnd.jpg'), //
                fit: BoxFit.cover, //
              ),


            ),

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset("lib/Assets/postimage.jpg"),

                  SizedBox(height: 3,),



                  Text(
                    'Content  ID: ${post.id}',

                    style: TextStyle(
                        color: Color(0xFF7F7F7F), fontSize: 18),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    post.title.toString(),
                    style: const TextStyle(
                        color: Color(0xFF222221),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),


                  Row(
                    children: [

                      Text(
                        "User ID:" + post.userId.toString(),
                        style: TextStyle(
                            color: Color(0xFFD20073),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),

                      Row(
                        children: [
                          Image.asset("lib/Assets/link.jpg"),
                          SizedBox(width: 8,),
                          Text("লিঙ্ক কপি করুন",style: TextStyle(
                            color: Color(0xFFD20073),fontWeight: FontWeight.bold,fontSize: 14
                          ),)

                        ],
                      )


                    ],
                  ),

                  SizedBox(height: 3,),

                  Divider(
                    color: Color(0xFFD20073),
                  ),








                  SizedBox(height: 5),
                  Text(
                    post.body.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}