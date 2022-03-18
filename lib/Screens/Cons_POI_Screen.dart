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
                  _miPOI(),
                  _miPOI(),
                  _miPOI(),
                  _miPOI(),
                  _miPOI(),
                  _miPOI(),
              ]
            ),
          )
        )
      );
    }

 Widget _miPOI() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(15),

    elevation: 10,
    child: Column(
      children: <Widget>[
        Image.asset('assets/Reporte/Garb.jpeg'),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Punto de interés'),
          subtitle: Text('Calle 111b x 52 y 52 A, Colonia Mercedes Barrera. Exceso de basura.'),leading: 
          Icon(Icons.zoom_in_map, color: Color.fromARGB(255, 115, 209, 233) )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton.icon(icon: const Icon(Icons.visibility, size: 20.0, color: Color.fromARGB(255, 132, 236, 123)),
                  label: const Text('Visitar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                  onPressed: () {
                  ('Confirmación');},
                ),
            TextButton.icon(icon: const Icon(Icons.confirmation_num, size: 20.0, color: Color.fromARGB(255, 121, 241, 74)),
                  label: const Text('Confirmar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                  onPressed: () {
                  ('Confirmación');},
                ),

            TextButton.icon(icon: const Icon(Icons.remove_circle, size: 20.0, color: Color.fromARGB(255, 240, 68, 68)),
                  label: const Text('Rechazar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                  onPressed: () {
                  ('Rechazo');},
                ),
          ],
        )
      ],
    ),
  );
}
}