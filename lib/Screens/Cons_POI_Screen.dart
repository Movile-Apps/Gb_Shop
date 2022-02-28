import 'package:flutter/material.dart';

 class ConsPOIScreen extends StatelessWidget{

   const ConsPOIScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Puntos de Interes'),
        ),
        body: const Center(
          child: Text('In process...'),
        ),
      );
    }
 }