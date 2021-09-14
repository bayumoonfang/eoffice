

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eoffice/page_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget{

  @override
  _SplashScreen createState() => _SplashScreen();
}


class _SplashScreen extends State<SplashScreen> {


  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => PageLogin()));
    });
  }


  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
     return Container(
       height: double.infinity,
       width: double.infinity,
       color: Colors.white,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Image.asset("assets/eoffice2.png",width: 300,),
         ],
       )
     );
  }
}