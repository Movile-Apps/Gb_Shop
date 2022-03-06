import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';

 class ConsPOIScreen extends StatelessWidget{

   const ConsPOIScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
            },
          ),
        ],
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