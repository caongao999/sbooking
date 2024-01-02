import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({super.key});

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Row(
          children: [
            Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.blueGrey,
                  //image: DecorationImage(image: NetworkImage('https://png.pngtree.com/png-clipart/20210605/ourmid/pngtree-abstract-round-logo-png-image_3423575.jpg'))
                ),
                child: Icon(Icons.logo_dev_outlined)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("S_Booking",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700
                ),),
            ),
            Spacer(),
            badge.Badge(             //đây là cái hiện thông báo trong giỏ hàng
              badgeContent: Text('3'),
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.notifications),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: IconButton(
                  onPressed: () {

                  },
                  icon:Icon(Icons.search)),
            )
          ],
        ),
      ),
    );
  }
}
