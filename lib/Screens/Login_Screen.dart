import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/LoginScreens.dart';

 class LoginScreen extends StatelessWidget{

   const LoginScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenido, De nuevo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistroScreen(),));
            }, child: const Text('Crear una cuenta nueva'),
          ),
        ),
      );
    }
 }
 