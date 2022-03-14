// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:gb_shop/Widgets/custom_Input_form_field_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class RegistroScreen extends StatefulWidget{
  static String id = 'RegistroScreen';
  const RegistroScreen({Key? key}) : super(key: key);

  @override 
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {

  var imagen;
  final picker = ImagePicker();

  Future selImagen(op) async{

    PickedFile? pickedFile;

    if(op == 1){
      pickedFile = await picker.getImage(source: ImageSource.camera);

    }else{
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      if(pickedFile !=null){
        imagen = File(pickedFile.path);
      }else{
        // ignore: avoid_print
        print('No elegiste ninguna foto');
      }
    });

    Navigator.of(context).pop();

  }

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
                    selImagen(1);
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
                    selImagen(2);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(child: Text('Seleccionar una foto', style: TextStyle(fontSize: 16),
                         )
                        ),
                        const Icon(Icons.image, color: Color.fromARGB(255, 106, 223, 145))
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
                //Boton para activar la camara
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        primary: Colors.amber
                      ),
                  onPressed: () {
                    opciones(context);
                  },
                  child: const Text("Selecciona una imagen"),
                ),

                //Botion de crear cuenta
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 20, 252, 51)
                      ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          child: const Text('Crear cuenta',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      }
                    ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 236, 23, 23)
                      ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                          child: const Text('Cancelar',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      }
                    ),
              ],
                ),
                imagen == null ? const Center() : Image.file(imagen)
              ],
            ),
          ),
        )
    )
  ); 
 }  
}

