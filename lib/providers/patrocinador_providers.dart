import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Patrocinador.dart';
import 'package:gb_shop/Models/Response.dart';
import 'package:gb_shop/Models/ResponseList.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class PatrocinadorProvider extends ChangeNotifier{
  ResponseList request = ResponseList();
  final String _host ='www.garbagereport.somee.com';
  //final Map<String, dynamic> _parameters = {'key':'960d9f80'};
  PatrocinadorProvider(){
    fetchetiqueta();
  }

  fetchetiqueta() async {
    const String endPoint ='/api/Patrocinador';
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

  Future<Response> post(Patrocinador patrocinador) async{
    const String endPoint ='/api/Patrocinador';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url, headers: {HttpHeaders.contentTypeHeader: 'application/json'}, body: patrocinadorToJson(patrocinador));
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
        data: List<Patrocinador>.from(json["data"].map((x) => Patrocinador.fromJson(x))),
    );

  Map<String, dynamic> encode(ResponseList object) => {
        "exito": object.exito,
        "mensaje": object.mensaje,
        "data": object.data?.map((x) => x.toJson())
    };
}