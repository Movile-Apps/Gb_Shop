import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Reporte.dart';
import 'package:gb_shop/Models/Response.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ReporteProvider extends ChangeNotifier{
  Response request = Response();
  final String _host ='www.gbshopapi.somee.com';
  //final Map<String, dynamic> _parameters = {'key':'960d9f80'};
  ReporteProvider(){
    fetchetiqueta();
  }

  fetchetiqueta() async {
    const String endPoint ='/api/Reporte';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      request = decode(json.decode(response));
    } finally {
      client.close();
     }
  } 

  decode(Map<String, dynamic> json) => Response(
        exito: json["exito"],
        mensaje: json["mensaje"],
        data: List<Reporte>.from(json["data"].map((x) => Reporte.fromJson(x))),
    );

  Map<String, dynamic> encode(Response object) => {
        "exito": object.exito,
        "mensaje": object.mensaje,
        "data": object.data?.map((x) => x.toJson())
    };
}
