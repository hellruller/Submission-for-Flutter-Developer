import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../Controllers/Postcontroller.dart';
import '../Dbhelper/DatabaseHelper.dart';
import '../Modelclasses/PostModel.dart';

class pstlist {


  final  postcontroller PostController =
  Get.find<postcontroller>();
  final DatabaseHelper dbHelper = DatabaseHelper.instance;



  Future<List<postemodel>> postinfo() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    try {
      var response = await http.get(url).timeout(const Duration(seconds: 20));


      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        PostController.PostList.clear();

        jsonData.forEach((e) {
          PostController.PostList.add(postemodel.fromJson(e));

          dbHelper.isRecordExists(e['id']).then((exists) {
            if (!exists) {

              dbHelper.insert(postemodel.fromJson(e));
            }
          });
        });
        return PostController.PostList;
      } else {

        throw ('HTTP error: ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      throw ('Timeout: $e');
    } on SocketException catch (e) {
      throw ('Network error: $e');
    } on http.ClientException catch (e) {
      throw ('Client error: $e');
    } catch (e) {
      throw ('Unexpected error: $e');
    }
  }
}