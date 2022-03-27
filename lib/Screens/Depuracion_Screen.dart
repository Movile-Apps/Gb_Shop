import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Etiqueta.dart';
import 'package:gb_shop/providers/providers.dart';
import 'package:provider/provider.dart';
import '../Models/Etiqueta.dart';


class DepuracionScreen extends StatelessWidget {
  const DepuracionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        final etiquetaProvider = Provider.of<EtiquetaProvider>(context);
          final Response etiqueta = etiquetaProvider.request;

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
                     title: Text('Etiqueta: ${etiqueta.nombre}')
                    ))
              ],)),)
     ),
    );
  }
}