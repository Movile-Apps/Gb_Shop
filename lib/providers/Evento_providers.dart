import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Evento.dart';
import 'package:gb_shop/Models/Response.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class EventoProvider extends ChangeNotifier{
  Response request = new Response();
  final String _host ='www.gbshopapi.somee.com';
  //final Map<String, dynamic> _parameters = {'key':'960d9f80'};
  EventoProvider(){
    fetchetiqueta();
  }

  fetchetiqueta() async {
    const String endPoint ='/api/EventoLimpieza';
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

  Future<Evento> post(Evento evento) async{
    const String endPoint ='/api/EventoLimpieza';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await http.post(url,body: eventoToJson(evento));
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }

  decode(Map<String, dynamic> json) => Response(
        exito: json["exito"],
        mensaje: json["mensaje"],
        data: List<Evento>.from(json["data"].map((x) => Evento.fromJson(x))),
    );

  Map<String, dynamic> encode(Response object) => {
        "exito": object.exito,
        "mensaje": object.mensaje,
        "data": object.data?.map((x) => x.toJson())
    };
}