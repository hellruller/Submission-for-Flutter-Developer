import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ApiCalls/Postcall.dart';
import 'Widgets/LsitviewforHome.dart';




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pstlist postListInstance = pstlist();






  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;



    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color:  Color(0xFFFFFFFF),
            boxShadow:[
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(5.0, 5.0), //(x,y)
                blurRadius: 8.0,
              ),
            ],
          ),


        ),


      title:
      Text(widget.title,),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage('lib/Assets/Bkgnd.jpg'),
    fit: BoxFit.cover,
    ),
    ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: screenHeight * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFFE5E5E5),
                      ),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40
                        ),

                        Icon(
                          Icons.search,
                          color: Color(0xFF7F7F7F),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Search ...",
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 5,),










              ],
            ),

            SizedBox(height: 10),


            MyListViewWidget()



        ],
      ),

      )
    );
  }
}
