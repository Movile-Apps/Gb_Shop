import 'package:flutter/material.dart';

 class ConsPOIScreen extends StatelessWidget{

   const ConsPOIScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Puntos de Interes'),
          elevation: 0,
        centerTitle: true,
        ),
        body: const Center(
          child: Text('In process...'),
        ),
      );
    }
 }