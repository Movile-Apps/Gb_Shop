import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';

 class HomeScreen extends StatelessWidget{

   const HomeScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
          },
        ),
          title: Image.asset('assets/TexLogo.png', width: 600, height: 800,),
          elevation: 0,
          centerTitle: true,
        ),
      );
    }
 }