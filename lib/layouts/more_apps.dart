// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

import '../const.dart';

class MoreApps extends StatelessWidget {
  const MoreApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackGroundColor1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await LaunchApp.openApp(
                  androidPackageName: 'net.ifeps.idea_hunter',
// openStore: false
                );
              },
              child: Center(
                child: Container(
                  height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/ideahunter_icon.png'),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(30)
                    ),
                ),
              ),
            ),
            Text('Idea Hunter',style: kAppTitle),

          ],
        ),
      ),
    );
  }
}
