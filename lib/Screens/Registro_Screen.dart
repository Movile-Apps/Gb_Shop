
// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Usuario.dart';
import 'package:gb_shop/Models/Foto.dart';
import 'package:gb_shop/Screens/Login_Screen.dart';
import 'package:gb_shop/main.dart';
import 'package:provider/provider.dart';
import '../Models/ResponseList.dart';
import '../providers/Usuario_provider.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  _UsuariocreenState createState() => _UsuariocreenState();
}

class _UsuariocreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    

     final usuarioProvider = Provider.of<UsuarioProvider>(context);
      final ResponseList reporte = usuarioProvider.request;
      final Usuario Usuario1 = Usuario(idUsuario: 0, idFoto: 0, fotoRequest: Foto(idFoto: 0, nombre: null, url: null));

    //first name field
    final nombreusuario = TextFormField(
        autofocus: true,
        autocorrect: true,
        maxLines: 1,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: Usuario1.nombre,
        onChanged: (value) => Usuario1.nombre = value,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (!regex.hasMatch(value)) {
            return ("Tan siquiera 3 caracteres por favooor");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.supervised_user_circle_rounded,
            color: Color.fromARGB(255, 119, 238, 89)
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: 'Nombre',
          hintText: "Ingresa tu nombre de pila",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final apellidosusuario = TextFormField(
        autofocus: false,
        autocorrect: true,
        initialValue: Usuario1.apellido,
        onChanged: (value) => Usuario1.apellido = value,
        maxLines: 1,
        keyboardType: TextInputType.streetAddress,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena el campo';
          }
          if (value.length > 40) {
            return ("No  puede escribir mas de  40 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: Color.fromARGB(255, 119, 238, 89)
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: 'Apellidos',
          hintText: "Paterno y Materno",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //  Correo
    final correousuario = TextFormField(
        autofocus: false,
        autocorrect: true,
        maxLines: 1,
        initialValue: Usuario1.correo,
        onChanged: (value) => Usuario1.correo = value,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          // ignore: unnecessary_new
          if (value == null || value.isEmpty) {
            return 'Por favor llena el campo';
          }
          if (value.length > 50) {
            return ("No  puede escribir mas de  50 caracteres.");
          }

          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock_clock,
            color:Color.fromARGB(255, 119, 238, 89)
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: 'Correo electronico',
          hintText: "Ejemplo@gmail.com",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passousuario = TextFormField(
        initialValue: Usuario1.contrasea,
        autofocus: false,
        autocorrect: true,
        maxLines: 1,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        onChanged: (value) => Usuario1.contrasea = value,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color:Color.fromARGB(255, 119, 238, 89)
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: 'Contraseña',
          hintText: "No se la pases a nadie...",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //signup button
    final siguienteusuario = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.amber,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              usuarioProvider.post(Usuario1);
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
              
            }
          },
          child: const Text(
            "Registrarse",
            textAlign: TextAlign.center,
            // ignore: unnecessary_const
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Image.asset('assets/Uso/TexLogo.png', width: 600, height: 800,),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 180,
                      child: Image.asset(
                        "assets/Uso/Registro.png",
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(height: 45),
                  nombreusuario,
                  const SizedBox(height: 20),
                  apellidosusuario,
                  const SizedBox(height: 20),
                  correousuario,
                  const SizedBox(height: 20),
                  passousuario,
                  const SizedBox(height: 20),
                  siguienteusuario,
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
