
// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Usuario.dart';
import 'package:gb_shop/Models/Foto.dart';
import 'package:gb_shop/main.dart';
import 'package:provider/provider.dart';
import '../Models/ResponseList.dart';
import '../providers/Usuario_provider.dart';
import 'Registro_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    

     final usuarioProvider = Provider.of<UsuarioProvider>(context);
      final ResponseList reporte = usuarioProvider.request;
      final Usuario Usuario1 = Usuario(idUsuario: 0, nombre: null, apellido: null, idFoto: 0, fotoRequest: Foto(idFoto: 0, nombre: null, url: null));
  

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
          hintText: "Sé que la recuerdas",
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
              if (usuarioProvider.request.exito == 1) {
                Scaffold.of(context)
                    // ignore: deprecated_member_use, unnecessary_const
                    .showSnackBar(const SnackBar(
                        content:
                             Text('Bienvenido')));
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GbShop(),));
              } else {
                Scaffold.of(context)
                    // ignore: deprecated_member_use, unnecessary_const
                    .showSnackBar(const SnackBar(
                        content:  Text('El usuario no se pudo agregar')));
              }
            }
          },
          child: const Text(
            "Iniciar sesión",
            textAlign: TextAlign.center,
            // ignore: unnecessary_const
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.greenAccent,
          title: Image.asset('assets/Uso/TexLogo.png'),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/Uso/Registro.png",
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(height: 45),
                  const SizedBox(height: 20),
                  correousuario,
                  const SizedBox(height: 20),
                  passousuario,
                  const SizedBox(height: 20),
                  siguienteusuario,
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistroScreen(),));
                    }, 
                    child: const Text('Registrarse'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
