import 'package:flutter/material.dart';

 class AboutScreen extends StatelessWidget{

   const AboutScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Sobre nosotros'),),
        body: Container(
          child: Image.asset('assets/LogoAbout.png', width: 400, height: 200),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(20)
          ),
        )
      );
    }
 }