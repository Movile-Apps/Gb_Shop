import 'package:gb_shop/Screens/LoginScreens.dart';
import 'package:gb_shop/Widgets/login_form_field.dart';
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.greenAccent,
          title: Image.asset('assets/Uso/TexLogo.png', width: 600, height: 800,),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          
          child: Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Image.asset('assets/Uso/LogIN.png', height: 200.0,),
                const loginFormField(labelText: 'Email', hintText: 'ejemplo@gmail.com', icon: Icons.email,),
                const loginFormField(labelText: 'Contraseña', hintText: 'Escribe tu contraseña',icon: Icons.lock),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        primary: Colors.amber
                      ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Iniciar sesión"),
                ),
                TextButton(
                  onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistroScreen(),));
                  }, 
                  child: const Text('Registrarse'))
              ],
            ),
          ),
        )
      )
    );
  }
 }