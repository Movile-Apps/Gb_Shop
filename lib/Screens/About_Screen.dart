import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/Screens.dart';

 class AboutScreen extends StatelessWidget{

   const AboutScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
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
          title: const Text('Sobre nosotros'),
          elevation: 0,
          centerTitle: true,
          ),
          
          //Cards about
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[

                _crearCard2(),

                _crearCard1(),

                _crearCard5(),

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
            Image.asset('assets/Cards/GB.png')
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
           Image.asset('assets/Cards/UTM.png') 
         ]
       ),
     )
   );
 }

Widget _crearCard3() {

   return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(
         children: <Widget>[
             Image.asset('assets/Cards/RF.png')
          ]
        ),
      )
    );
 }

Widget _crearCard4() {

   return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(
         children: <Widget>[
             Image.asset('assets/Cards/DN.png')
          ]
        ),
      )
    );
 }

 Widget _crearCard5() {

   return Card(
     elevation: 5,
     color: Colors.white,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

     child: Container(
       child: Column(
        children: <Widget>[
           Image.asset('assets/Cards/Des.png') 
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