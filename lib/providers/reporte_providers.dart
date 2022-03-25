import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Reporte.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ReporteProvider extends ChangeNotifier{
  List<Reporte> reportes = [];
  final String _host ='my.api.mockaroo.com';
  final Map<String, dynamic> _parameters = {'key':'960d9f80'};
  ReporteProvider(){
    fetchReportes();
  }

  fetchReportes() async {
    const String endPoint ='reporte.json';
    final url = Uri.https(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      reportes =
         List<Reporte>.from(json.decode(response).map((x) => Reporte.fromJson(x)));
    } finally {
      client.close();
     }
  } 
}
