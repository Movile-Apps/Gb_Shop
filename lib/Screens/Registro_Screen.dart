// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/LoginScreens.dart';

class RegistroScreen extends StatefulWidget{
  static String id = 'RegistroScreen';

  const RegistroScreen({Key? key}) : super(key: key);

  @override 
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
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
        body: ListView(
            
            children: [
              Flexible(
                child: Image.asset('assets/Registro.png',
                height: 300.0,
              
                ),
              ),
              
              _userTextField(),
              const SizedBox(height: 15,),
              _confirmuserTextField(),
              const SizedBox(height: 15,),           
              _passwordTextField(),
              const SizedBox(height: 20.0,),
              _confirmpasswordTextField(),
              const SizedBox(height: 20.0,),
              _nombreTextField(),
              const SizedBox(height: 20.0,),
              _apellidoTextField(),
              const SizedBox(height: 20.0,),
              _bottonImage(),          
              _bottonRegistro(),
            ],
          )

        ),
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

  Widget _confirmuserTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(

            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(

              icon: Icon(Icons.email),
              hintText: 'Escribe el mismo correo',
              labelText: 'Confirma tu correo'
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
              hintText: 'Contraseña nueva',
              labelText: 'Contraseña'
            ),
          ),
        );
      }
    );
  }

  Widget _confirmpasswordTextField() {

    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(
            
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Escribe la misma contraseña',
              labelText: 'Confirma tu contraseña'
            ),
          ),
        );
      }
    );
  }

    Widget _nombreTextField() {
      return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(
            
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Nombre o nombres',
              labelText: 'Nombre'
            ),
          ),
        );
      }
    );
  }

  Widget _apellidoTextField() {
      return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(
            
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              icon: Icon(Icons.person_add),
              hintText: 'Apellido paterno y materno.',
              labelText: 'Apellidos'
            ),
          ),
        );
      }
    );
  }


Widget _bottonRegistro() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
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
        splashColor: Color.fromARGB(255, 99, 223, 245),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
        }
      );
      }
    );
  }

Widget _bottonImage() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Seleccionar foto',
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
        color: Color.fromARGB(255, 148, 240, 163),
        splashColor: Color.fromARGB(255, 245, 229, 85),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
         }
       );
      }
    );
  }


  

}

  
  
