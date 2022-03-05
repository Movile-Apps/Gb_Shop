import 'package:flutter/material.dart';

 class MapScreen extends StatelessWidget{

   const MapScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Bienvenio a lo mas genial'),
          elevation: 0,
        centerTitle: true,
        ),
        body: const Center(
          child: Text('In process...'),
        ),
      );
    }
 }