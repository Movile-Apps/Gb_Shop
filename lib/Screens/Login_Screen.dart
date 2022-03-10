// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/Screens.dart';

class LoginScreen extends StatefulWidget{
  static String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override 
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Image.asset('assets/TexLogo.png', width: 600, height: 800,),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            
            children: [
              Flexible(
                child: Image.asset('assets/LogIN.png',
                height: 300.0,
              
                ),
              )
              ,
              const SizedBox(height: 15.0,),
              _userTextField(),
              const SizedBox(height: 15,),
              _passwordTextField(),
              const SizedBox(height: 20.0,),
              _bottonLogin(),
              _bottonRegistro()
            ],
          )
        ),
      )
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(

            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(

              icon: Icon(Icons.email),
              hintText: 'ejemplo@gmail.com',
              labelText: 'Correo Electronico'
            ),

          ),
        );
      }
    );
  }

  Widget _passwordTextField() {

    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(
            
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Contraseña',
              labelText: 'Contraseña'
            ),
          ),
        );
      }
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
            child: const Text('Iniciar Sesion',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 10.0,
        color: Colors.amber,
        onPressed: (){
          Navigator.pop(context);
        }
      );
      }
    );
  }

  Widget _bottonRegistro() {
      return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
            ),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistroScreen(),));
          }, child: const Text('Registrarse'),
        );
        }
      );
    }

}
