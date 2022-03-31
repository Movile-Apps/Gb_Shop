
import 'dart:convert';
import 'package:gb_shop/Widgets/login_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/Screens.dart';
import 'package:http/http.dart';
import '../main.dart';


class LoginScreen extends StatefulWidget{
  static String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override 
  
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final Map<String, String> formValues = {
    'Email' : '',
    'Contraseña' : ''
    };
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
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
                
                  loginFormField(
                  labelText: 'Email', 
                  hintText: 'ejemplo@gmail.com', 
                  icon: Icons.email,
                  propertyName: 'email',
                  formValues: formValues),

                 loginFormField(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Contraseña', 
                  hintText: 'Escribe tu contraseña',
                  icon: Icons.lock,
                  propertyName: 'contraseña',
                  formValues: formValues),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        primary: Colors.amber
                      ),
                  onPressed: () {                   
                   bool isValidate = myFormKey.currentState?.validate() ?? false;
                            if (isValidate) {
                              Future<int> code = postLogin(formValues);
                              if(postLogin(formValues) == 201){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const GbShop(),));
                              }

                            }
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

  postLogin(Map formvalues) async {
   const String endPoint = 'api/Usuario';
   const String _host = 'www.garbagereport.somee.com';
   final url = Uri.https(_host, endPoint);
   Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
   
   Response response = await post(url, body: json.encode(formvalues), headers: requestHeaders);
   int status = response.statusCode;
   return status;
}