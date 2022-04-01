import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Response.dart';
import 'package:gb_shop/Models/Usuario.dart';
import 'package:gb_shop/Models/ResponseList.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class UsuarioProvider extends ChangeNotifier{
  ResponseList request = ResponseList();
  final String _host ='www.garbagereport.somee.com';
  //final Map<String, dynamic> _parameters = {'key':'960d9f80'};
  UsuarioProvider(){
    fetchetiqueta();
  }

  fetchetiqueta() async {
    const String endPoint ='/api/Usuario';
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

  Future<Response> post(Usuario usuario) async{
    const String endPoint ='/api/Usuario';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url, headers: {HttpHeaders.contentTypeHeader: 'application/json'}, body: usuarioToJson(usuario));
     // notifyListeners();
      print(response.body);
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }

  Future<Response> getbyid(int id) async{
    final String endPoint ='/api/Usuario/' + id.toString();
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.get(url);
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
        data: json["data"],
  );

  decodeList(Map<String, dynamic> json) => ResponseList(
        exito: json["exito"],
        mensaje: json["mensaje"],
        data: List<Usuario>.from(json["data"].map((x) => Usuario.fromJson(x))),
    );

  Map<String, dynamic> encode(ResponseList object) => {
        "exito": object.exito,
        "mensaje": object.mensaje,
        "data": object.data?.map((x) => x.toJson())
    };
}
