import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/LoginScreens.dart';

 class RegistroScreen extends StatelessWidget{

   const RegistroScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Registro para usuarios nuevos'),
          elevation: 0,
          centerTitle: true,
          
          ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
            }, child: const Text('Iniciar sesion'),
          ),
        ),
      );
    }
 }