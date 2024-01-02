import 'package:flutter/material.dart';

import 'Account_Page.dart';
import 'My_Event.dart';
import 'homedemo.dart';
 
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page_index = 0; //khởi tạo đối tượng đang đứng có index là 0

  List<Widget> _pages = [  //khai báo LIST chứa các widget để chuyển trang
    HomeDemo(),
    My_Event(),
    Account_Page(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page_index,  //xây dựng hàm xác định index trang
        onTap: (value) {   //khi ấn vào 1 biểu tượng thì nói sẽ chuyển page đúng với đối tượng đang ấn
          setState(() {
            _page_index = value;
          });
        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits),
              label: 'product'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'account'
          ),

        ],
      ),

      body: _pages[_page_index], //page đi theo biến _page_index
    );
  }
}
