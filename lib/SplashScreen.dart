import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'ApiCalls/Postcall.dart';
import 'Dbhelper/DatabaseHelper.dart';
import 'HomPage/HomePage.dart';

class splashscreeen extends StatefulWidget {
  const splashscreeen({super.key, required String title});

  @override
  State<splashscreeen> createState() => _splashscreeenState();
}

class _splashscreeenState extends State<splashscreeen> {

  final pstlist postListInstance = pstlist();


  void initState() {
    super.initState();
     loadPostData();
    printSavedPosts();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => MyHomePage(title: 'STAR',));
    });


  }

  void loadPostData() async {
    try {
      await postListInstance.postinfo();
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  Future<void> printSavedPosts() async {
    final dbHelper = DatabaseHelper.instance;
    final posts = await dbHelper.getAllPosts();
    for (var post in posts) {
      print("Post ID: ${post.id}");
      print("User ID: ${post.userId}");
      print("Title: ${post.title}");
      print("Body: ${post.body}");
      print("\n");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
             "lib/Assets/Bkgnd.jpg",

            fit: BoxFit.cover,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                child: Icon(
                  Icons.medical_services_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}