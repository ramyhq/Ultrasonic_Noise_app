// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ultrasonic_noise/layouts/about_app.dart';
import '../const.dart';
import 'more_apps.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        right: false,
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: Color(0xffffcc00),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //shrinkWrap: true,
          children: [
            DrawerItem(text: 'More Apps',onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MoreApps()));
            }),
            DrawerItem(text: 'About App',onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutApp()));
            }),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key, required this.text, required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black87.withOpacity(0.8),
        borderRadius: BorderRadius.circular(22),
      ),
      child: ListTile(
        title:  Text(text,style: kDrawerItemStyle ,textAlign: TextAlign.center,),
        onTap: onTap,
      ),
    );
  }
}
