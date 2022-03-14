import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';

 class ConsPOIScreen extends StatelessWidget{

   const ConsPOIScreen ({Key? key}) : super(key : key);
   
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
          title: const Text('Puntos de Interes'),
          elevation: 0,
        centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                  _crearCardPrincipal(),
                  _crearCardPrincipal(),
                  _crearCardPrincipal(),
                  _crearCardPrincipal(),
                  _crearCardPrincipal(),
                  _crearCardPrincipal(),
                  _crearCardPrincipal(),
            ]
        ),
          )
        )
      );
    }


  Widget _crearCardPrincipal() {
   return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/Garb.jpeg', height: 370.0, width: 400.0,),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text('Motivo: Animales en descomposicion, Calle 111b x 52 y 52 A', softWrap: true,),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.done_all_rounded, size: 20.0, color: Color.fromARGB(255, 88, 255, 82)),
                  label: const Text('Confirmar'),
                  onPressed: () {
                   ('Confirmar');
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.remove_circle, size: 20.0, color: Color.fromARGB(255, 240, 68, 68)),
                  label: const Text('Rechazar'),
                  onPressed: () {
                  ('Rechazar');
                  },
                ),
               ],
             )
            )
          ]
        )
      );

    
  }
}