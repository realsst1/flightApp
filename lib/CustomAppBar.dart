import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final List<BottomNavigationBarItem> list=[];

  CustomAppBar(){
    list.add(
        BottomNavigationBarItem(
            title: Text("Explore",style: TextStyle(color: Colors.black),),
            icon: Icon(Icons.explore,color: Colors.black,)
        ),
    );
    list.add(
      BottomNavigationBarItem(
          title: Text("Favourites",style: TextStyle(color: Colors.black),),
          icon: Icon(Icons.favorite,color: Colors.black,)
      ),
    );
    list.add(
      BottomNavigationBarItem(
          title: Text("Deals",style: TextStyle(color: Colors.black),),
          icon: Icon(Icons.local_offer,color: Colors.black,)
      ),
    );
    list.add(
      BottomNavigationBarItem(
          title: Text("Notifications",style: TextStyle(color: Colors.black),),
          icon: Icon(Icons.notifications,color: Colors.black,)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: BottomNavigationBar(
        items: list,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
