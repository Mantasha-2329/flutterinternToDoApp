import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_listapp/main.dart';


class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>TodoListScreen(),)
      );
    });

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(child: Text("TO-DO App",style:TextStyle(fontSize: 27,
            fontWeight: FontWeight.w500,color: Colors.white),)),
      ),
    );

  }
}