import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Etiqueta.dart';
import 'package:gb_shop/Models/ResponseList.dart';
import 'package:gb_shop/providers/providers.dart';
import 'package:provider/provider.dart';
import '../Models/Foto.dart';

class DepuracionScreen extends StatelessWidget {
  const DepuracionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        final etiquetaProvider = Provider.of<EtiquetaProvider>(context);
          final ResponseList etiqueta = etiquetaProvider.request;

    return MaterialApp(
      title: 'Pruebas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SafeArea(
          child: Center(
            child: ListView(
              scrollDirection: 
              Axis.vertical, physics: const BouncingScrollPhysics(),
              children: [

                    Text('Estado: ${etiqueta.exito}'),
                    Text('Mensaje: ${etiqueta.mensaje}'),
                    
                    ...?etiqueta.data?.map((etiqueta) => ListTile(
                     title: Text('Etiqueta: ${etiqueta.nombre}'),
                     subtitle: Text('Etiqueta: ${etiqueta.descripcion}'),
                    )),
                         Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.all(5)        ,
        
                            elevation: 5,
                            child: Column(
                                       children: <Widget>[
                                   ListTile(
                                    contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
                                    title: const Text('Evento de limpieza'),
                                    subtitle: Text('Estado: ${etiqueta.exito} Mensaje: ${etiqueta.mensaje}'),
                                    leading: const Icon(Icons.gpp_maybe_sharp, color: Color.fromARGB(255, 40, 199, 133) )),
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
                                                  )        ,
        
                                      TextButton.icon(icon: const Icon(Icons.remove_circle, size: 20.0, color: Color.fromARGB(255, 240, 68, 68)),
                                            label: const Text('Rechazar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                                            onPressed: () {
                                            ('Rechazo');},
                                          ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            TextButton.icon(icon: const Icon(Icons.abc, size: 20.0, color: Color.fromARGB(255, 145, 240, 68)),
                                            label: const Text('Rechazar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                                            onPressed: () {
                                            final Foto ft = Foto(idFoto: 0, nombre: 'Foto', url: 'dADFAAA');
                                            final Etiqueta et = Etiqueta(idEtiqueta: 0, nombre: 'Hola', idFoto: 0, descripcion: 'Es una pasada', fotoRequest: ft);

                                            etiquetaProvider.post(et);
                                            },
                                          ),
              ],        
              )
              ),
              )
     ),
    );
  }
}