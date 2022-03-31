// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/Screens.dart';
import 'package:gb_shop/Widgets/reporte_form_field_widged.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class ReporteScreen extends StatefulWidget{
  static String id = 'RegistroScreen';
  const ReporteScreen({Key? key}) : super(key: key);

  @override 
  _ReporteScreenState createState() => _ReporteScreenState();
}

 class _ReporteScreenState extends State<ReporteScreen>{

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

   opciones(contex){
     showDialog(
       context: context,
       builder: (BuildContext context){
         return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              //Acciones para la foto
              children: [
                //Tomar foto
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
                        const Expanded(child: Text('Tomar una foto', style: TextStyle(
                          fontSize: 16
                         ),)
                        ),
                        const Icon(Icons.camera, color: Color.fromARGB(255, 106, 223, 145))
                      ],
                    ),
                  )
                ),
                //Elegir de la galeria
                InkWell(
                  onTap: (){
                    selImagen(2);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(child: Text('Seleccionar imagen de la galeria', style: TextStyle(
                          fontSize: 16
                         ),
                         )
                        ),
                        const Icon(Icons.image, color: Color.fromARGB(255, 106, 223, 145))
                      ],
                    ),
                  )
                ),

                //Cancelar
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
      final Map<String, String> formValues = {
    'Descripcion' : '',
    'etiqueta' : '',
    'Direccion' : '',
    'Etiqueta' : '',
    };

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

      final List<String> motivodenuncias = [
        'Mucha basura',
        'Insectos',
        'Agua Estancada',
        'Mosquitos',
        'Animales en descomposicion'
      ];
      return  SafeArea(
      child: 
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
            },
          ),
        ],
          title: Image.asset('assets/Uso/TexLogoRep.png', width: 200, height: 400,),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Image.asset('assets/Uso/LogReporte.png', height: 200.0,),
                 ReporteFormFieldWidged(
                  labelText: 'Descripcion del lugar', 
                  hintText: 'Describe brevemente que encontraste.',
                  helperText: 'Dinos que fue lo que viste',
                  icon: Icons.tab_rounded,
                  propertyName: 'Descripcion',
                  formValues: formValues),

                 ReporteFormFieldWidged(
                  labelText: 'Direccion', 
                  hintText: 'Direccion de la calle',
                  helperText: 'Son dadas por el maps, tranquilo.',
                  icon: Icons.maps_home_work,
                  propertyName: 'Direccion',
                  formValues: formValues),

                  DropdownButtonFormField(
                    hint: const Text('Selecciona una etiqueta'),
                    icon: const Icon(Icons.card_membership),
                    items: motivodenuncias
                    .map((motivodenuncia) => 
                    DropdownMenuItem(child: Text(motivodenuncia), value: motivodenuncia.toLowerCase()))
                    .toList(),
                    
                onChanged: (value) {},),
                //Boton para camara
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: () {
                    opciones(context);
                  },
                  child: const Text("Selecciona una imagen"),
                ),

                //Boton de crear cuenta
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("Crear reporte"),
                ),
              imagen == null ? const Center() : Image.file(imagen)
          ]
         ),
        ),
      )
    )
   );
  }
 }



  
  
