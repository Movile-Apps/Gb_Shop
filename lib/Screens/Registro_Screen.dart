import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/LoginScreens.dart';

 class RegistroScreen extends StatelessWidget{

   const RegistroScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenido, aspirante a nuevo usuario'),),
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