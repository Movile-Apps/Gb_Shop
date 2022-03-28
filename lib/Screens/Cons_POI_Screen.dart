import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Response.dart';
import 'package:gb_shop/Screens/screens.dart';
import 'package:gb_shop/providers/Reporte_providers.dart';
import 'package:provider/provider.dart';

 class ConsPOIScreen extends StatelessWidget{

   const ConsPOIScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      //
      final reporteProvider = Provider.of<ReporteProvider>(context);
      final Response reporte = reporteProvider.request;

      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PerfilScreen(),));
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
                  ...?reporte.data
                      ?.map((reporte) => 
                         Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(15),

                    elevation: 5,
                    child: Column(
                               children: <Widget>[
                           ListTile(
                            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text('${reporte.idFoto}'),
                            subtitle: Text('Problema: ${reporte.descripcion} Fecha: ${reporte.fecha} Ubicación: ${reporte.geoubicacionRequest} Etiqueta: ${reporte.etiquetaRequest}'),
                            leading: const Icon(Icons.zoom_in_map, color: Color.fromARGB(255, 115, 209, 233) )),
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
                    )
                  )
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

    elevation: 5,
    child: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Image.asset('assets/Uso/Info.png', height: 200, width: 200,),
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('¿Qué es un punto de interés?'),
          subtitle: Text('Son reportes creados por otros usuarios.'),leading: 
          Icon(Icons.info_outline_rounded, color: Color.fromARGB(255, 233, 218, 82) )),
      ],
    ),
  );
}
}