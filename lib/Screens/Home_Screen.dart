import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';

 class HomeScreen extends StatelessWidget{

   const HomeScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_rounded),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
            },
          ),
        ],
          title: Image.asset('assets/TexLogo.png', width: 600, height: 800,),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[

                _crearCardPrincipal(),
                
              ],
         )

         
        )
      ),
     );
    }
/*Widgets*/
    Widget _crearCardPrincipal() {

   return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: Container(
        child: Column(
        children: <Widget>[
          Image.asset('assets/Portada.png', height: 170.0,),
          Container(
            padding: const EdgeInsets.all(10.0),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[     

                FlatButton.icon(
                  icon: const Icon(Icons.favorite, size: 18.0, color: Colors.redAccent),
                  label: const Text('Conoce mas sobre nosotros.'),
                  onPressed: () {
                  
                  },
                ),
              ],
            )
          )
        ],
      ),
     )
    );

    
  }
}
/** */