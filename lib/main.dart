// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:ffi';
import 'package:flutter/animation.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget  {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends   State<MyApp> with SingleTickerProviderStateMixin  {

  int checker = 0;

  String _now;
  Timer _everySecond;


  AnimationController controller;
  Animation colorAnimation;
  Animation colorAnimation_2;
  Animation sizeAnimation;


  @override
  void initState() {
    super.initState();


    controller =  AnimationController(reverseDuration: Duration(seconds: 2), vsync: this, duration: Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Color.fromRGBO(250,121, 101, 1), end: Color.fromRGBO(200,121, 101, 1)).animate(controller);
    colorAnimation_2 = ColorTween(begin: Color.fromRGBO(200,121, 101, 1), end: Color.fromRGBO(250,121, 101, 1)).animate(controller);

    controller.forward();


    controller.addListener(() {
      setState(() {});
    });


    // sets first value
    _now = DateTime.now().second.toString();

    _everySecond = Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {


        colorAnimation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {

            if(checker == 0)
              checker = 1;
            else
              checker = 0;

          }else{

            if(checker == 0)
              checker = 1;
            else
              checker = 0;

          }
        });

        print(checker);

        controller.repeat();


        _now = DateTime.now().second.toString();

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 25.5, top:100, right: 25.5, bottom:0),
          // color: main_color,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // colors: [
              //   color_1,
              //   color_2,
              //   color_3,
              //   // color_4,
              //   // color_5,
              //   // color_6,
              //   // color_7,
              //   // color_8,
              //   // color_9,
              //   // color_10,
              //   ],
              colors: [
                checker == 1 ? colorAnimation.value : colorAnimation_2.value,
                ],
              // stops:  [
              //   0.1,
              //   // 0.2,
              //   // 0.3,
              //   // 0.4,
              //   0.5,
              //   // 0.6,
              //   // 0.7,
              //   // 0.8,
              //   // 0.9,
              //   1,
              // ],
              stops:  [
                0.1,
              ],
            )
          ),
          child: Container(
            child: ListView(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('media/sun.svg',color: Colors.white,width: 140,),
                   Padding(
                       padding: EdgeInsets.only(left:15,top: 30,right: 0,bottom: 0),
                       child:  Text('23°',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 100))),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, top:0, right: 25, bottom:0),
                  child: Row(
                      children: [
                        SvgPicture.asset('media/humidity.svg',color: Colors.white,width: 25,),
                        Padding(
                            padding: EdgeInsets.only(left:5,top: 0,right: 0,bottom: 0),
                            child:  Text('23 mm',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15))),
                        Padding(padding:  EdgeInsets.only(left:25,top: 0,right: 0,bottom: 0)),
                        SvgPicture.asset('media/wind.svg',color: Colors.white,width: 25,),
                        Padding(
                            padding: EdgeInsets.only(left:5,top: 0,right: 0,bottom: 0),
                            child:  Text('7 m/s',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15))),
                        Padding(padding:  EdgeInsets.only(left:25,top: 0,right: 0,bottom: 0)),
                        SvgPicture.asset('media/thermometer.svg',color: Colors.white,width: 25,),
                        Padding(
                            padding: EdgeInsets.only(left:5,top: 0,right: 0,bottom: 0),
                            child:  Text('7 m/s',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15))),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}