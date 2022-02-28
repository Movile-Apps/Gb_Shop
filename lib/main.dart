import 'package:flutter/material.dart';
import 'package:gb_shop/routes/app_routes.dart';
import 'package:gb_shop/themes/AppTheme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garbage Report',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Garbage Report'),
        ),
        body: const Center(
          child: Text('In process..'),
        ),
      ),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getRoutes(),
      theme: AppTheme.LightTheme,
    );
  }
}