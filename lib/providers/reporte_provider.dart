import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ReporteProvider extends ChangeNotifier{
  final String _host ='my.api.mockaroo.com';
  final Map<String, dynamic> _parameters = {'key':'960d9f80'};

  ReporteProvider(){
    fetchReportes();
  }

  fetchReportes() async {
    final String endPoint ='users.json';
    final url = Uri.https(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
    } finally {
      client.close();
     }
  } 
}
