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
  opciones(context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [

                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1, color: Colors.green))
                    ),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(child: Text('Tomar una foto', style: TextStyle(fontSize: 16),
                         )
                        ),
                        const Icon(Icons.camera, color: Color.fromARGB(255, 106, 223, 145))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(child: Text('Seleccionar una foto', style: TextStyle(fontSize: 16),
                         )
                        ),
                        const Icon(Icons.picture_in_picture, color: Color.fromARGB(255, 106, 223, 145))
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.red
                    ),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(child: Text('Cancelar', style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                         )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );

      }
    );

  }

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
                    opciones(context);
                  },
                  child: const Text("Selecciona una imagen"),
                ),

                //Botion de crear cuenta
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

