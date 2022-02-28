import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/Screens.dart';

 class ReporteScreen extends StatelessWidget{

   const ReporteScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Crear Reporte'),),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen(),));
            }, child: const Text('Cancelar'),
          ),
        )
      );
    }
 }