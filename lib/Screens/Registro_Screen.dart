// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:gb_shop/Widgets/custom_Input_form_field_widget.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Image.asset('assets/Registro.png', height: 200.0,),
                const CustomInputFormFieldWidget(labelText: 'Email', hintText: 'ejemplo@gmail.com', icon: Icons.email,),
                const CustomInputFormFieldWidget(labelText: 'Contraseña', hintText: 'Escribe una nueva contraseña',icon: Icons.lock),
                const CustomInputFormFieldWidget(labelText: 'Confirma tu contraseña', hintText: 'Escribe la misma contraseña',icon: Icons.lock_sharp),
                const CustomInputFormFieldWidget(labelText: 'Nombre', hintText: 'Escribe tu nombre o nombres',icon: Icons.person),
                const CustomInputFormFieldWidget(labelText: 'Apellidos', hintText: 'Escribe tu apellido paterno y materno',icon: Icons.person),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Crear cuenta"),
                )
              ],
            ),
          ),
        )
    )
  ); 
 }  
}

