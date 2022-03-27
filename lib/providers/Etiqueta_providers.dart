import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Etiqueta.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class EtiquetaProvider extends ChangeNotifier{
  Response request = new Response();
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
      request = responseFromJson(response);
    } finally {
      client.close();
     }
  } 
}
