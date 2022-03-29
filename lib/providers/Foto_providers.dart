import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Foto.dart';
import 'package:gb_shop/Models/Response.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class FotoProvider extends ChangeNotifier{
  Response request = new Response();
  final String _host ='www.gbshopapi.somee.com';
  //final Map<String, dynamic> _parameters = {'key':'960d9f80'};
  FotoProvider(){
    fetchetiqueta();
  }

  fetchetiqueta() async {
    const String endPoint ='/api/Foto';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      request = decode(json.decode(response));
    } finally {
      client.close();
     }
  }

  Future<Foto> post(Foto foto) async{
    const String endPoint ='/api/Foto';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url,body: fotoToJson(foto));
      notifyListeners();
      print(response.body);
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }

  decode(Map<String, dynamic> json) => Response(
        exito: json["exito"],
        mensaje: json["mensaje"],
        data: List<Foto>.from(json["data"].map((x) => Foto.fromJson(x))),
    );

  Map<String, dynamic> encode(Response object) => {
        "exito": object.exito,
        "mensaje": object.mensaje,
        "data": object.data?.map((x) => x.toJson())
    };
}
