import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:login6868/%20ingredient/AppBarHome.dart';

class HomeDemo extends StatefulWidget {
  const HomeDemo({super.key});


  @override
  State<HomeDemo> createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomeDemo> {
  List<String> TitleN = [
    "Title1",
    "Title2",
    "Title3",
    "Title3",
    "Title3",
    "Title3",
    "Title3",
    "Title3",
    "Title3",
    "Title3",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
         AppBarHome(),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                // Ink.image(image: NetworkImage('')),
                                Text( TitleN[index],

                                  style: TextStyle
                                    (color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500

                                  ),),
                              ],
                            ),
                          ),
                          Text("Đây là dòng mô tả, dfgkhsldgskldukzsulglkszbg",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                            ),)
                        ],
                      ),
                    );
                  },
                )

            ),
          ),


        ],
      ),
    );
  }
}
