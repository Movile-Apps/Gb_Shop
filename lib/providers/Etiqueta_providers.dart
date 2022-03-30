import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Etiqueta.dart';
import 'package:gb_shop/Models/Response.dart';
import 'package:gb_shop/Models/ResponseList.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class EtiquetaProvider extends ChangeNotifier{
  ResponseList request = ResponseList();
  final String _host ='www.gbshopapi.somee.com';
  //final Map<String, dynamic> _parameters = {'key':'960d9f80'};
  EtiquetaProvider(){
    fetchetiqueta();
  }

  fetchetiqueta() async {
    const String endPoint ='/api/Etiqueta';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      request = decodeList(json.decode(response));
    } finally {
      client.close();
    }
  }

  Future<Response> post(Etiqueta etiqueta) async{
    const String endPoint ='/api/Etiqueta';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url, headers: {HttpHeaders.contentTypeHeader: 'application/json'}, body: etiquetaToJson(etiqueta));
      print(response.body);
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }

  decode(Map<String, dynamic> json) => Response(
        exito: json["exito"],
        mensaje: json["mensaje"],
        data: json["data"],
  );

  decodeList(Map<String, dynamic> json) => ResponseList(
        exito: json["exito"],
        mensaje: json["mensaje"],
        data: List<Etiqueta>.from(json["data"].map((x) => Etiqueta.fromJson(x))),
    );

  Map<String, dynamic> encode(ResponseList object) => {
        "exito": object.exito,
        "mensaje": object.mensaje,
        "data": object.data?.map((x) => x.toJson())
    };
}
