import 'package:flutter/material.dart';

 class AboutScreen extends StatelessWidget{

   const AboutScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Sobre nosotros'),),
          //Cards about
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[

                _crearCard1(),

                _crearCard2(),

                _crearCard3(),

                _crearCard4()


              ],

            ),
          ) ,
          )
        );
    }
 }

 Widget _crearCard1() {

   return Card(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

     child: Container(
       child: Column(
        children: <Widget>[

            const Text('Orgullo UTM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 20,),
            const Text('Grupo A - Quinto semestre - Desarrollo de Software Multiplataforma'),
            Image.asset('assets/Logo.png')
         ]
       ),
     )
   );
 }

 Widget _crearCard2() {

   return Card(
     elevation: 5,
     color: Colors.white,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

     child: Container(
       child: Column(
        children: <Widget>[

           const Text('Sobre el proyecto', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
           const SizedBox(height: 20,),
           const Text('Gb-Shop es una aplicacion que nacio por el deseo de querer ayudar a hacer un cambio positivo para el medio ambiente, a la vez, buscando motivar a mas personas de hacer lo mismo mediante una herramienta facil y sencilla de usar.',
           style: TextStyle(fontSize: 15),),
           Image.asset('assets/proj.png') 
            
            
         ]
       ),
     )
   );
 }

Widget _crearCard3() {

   return Card(
     color: Colors.orangeAccent[100],
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

     child: Container(
       child: Column(
        children: <Widget>[

            const Text('Rafael Cauich - Diseñador', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 20,),
            const Text('Programador estudiante del quinto semestre en la UTM, en el grupo A DSM. Que se divierte decorando toda la parte visual de la aplicaión.'),
            Image.asset('assets/RF.png')
         ]
       ),
     )
   );
 }

Widget _crearCard4() {

   return Card(
     color: Colors.tealAccent[100],
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

     child: Container(
       child: Column(
        children: <Widget>[

            const Text('Daniel Puch - Programador', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 20,),
            const Text('Programador estudiante del quinto semestre en la UTM, en el grupo A DSM. Que se divierte creando toda la parte interna de la aplicaión.'),
            Image.asset('assets/DN.png')
         ]
       ),
     )
   );
 }
 /*Container(
          child: Image.asset('assets/LogoAbout.png', width: 400, height: 200),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(20) */