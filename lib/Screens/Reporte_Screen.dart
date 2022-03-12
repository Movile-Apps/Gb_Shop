import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/Screens.dart';
import 'package:gb_shop/Widgets/reporte_form_field_widged.dart';

 class ReporteScreen extends StatelessWidget{

   const ReporteScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
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
          title: Image.asset('assets/TexLogoRep.png', width: 200, height: 400,),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Image.asset('assets/LogReporte.png', height: 200.0,),
                const ReporteFormFieldWidged(
                  labelText: 'Descripcion del lugar', 
                  hintText: 'Describe brevemente que encontraste.',
                  helperText: 'Dinos que fue lo que viste',
                  icon: Icons.tab_rounded
                  ),
                const ReporteFormFieldWidged(
                  labelText: 'Coordenadas', 
                  hintText: 'Lat/Long',
                  helperText: 'Son dadas por el maps, tranquilo.',
                  icon: Icons.maps_home_work
                  ),

                  DropdownButtonFormField(
                    hint: const Text('Selecciona una etiqueta'),
                    icon: const Icon(Icons.card_membership),
                    items: motivodenuncias
                    .map((motivodenuncia) => 
                    DropdownMenuItem(child: Text(motivodenuncia), value: motivodenuncia.toLowerCase()))
                    .toList(),
                onChanged: (value) {}),

                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("Selecciona una imagen"),
                ),

                //Boton de crear cuenta
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("Crear reporte"),
                ),
              ]
         ),
        ),
      )
    )
   );
  }
 }



  
  
