import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Evento.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class EventoProvider extends ChangeNotifier{
  List<Evento> eventos = [];
  final String _host ='www.gbshopapi.somee.com';
  //final Map<String, dynamic> _parameters = {'key':''};
  EventoProvider(){
    fetchEvento();
  }
//http://www.gbshopapi.somee.com/api/EventoLimpieza
  fetchEvento() async {
    const String endPoint ='/api/EventoLimpieza';
    final url = Uri.https(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      eventos =
         List<Evento>.from(json.decode(response).map((x) => Evento.fromJson(x)));
    } finally {
      client.close();
     }
  } 
}