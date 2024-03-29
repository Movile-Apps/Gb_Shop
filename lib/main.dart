import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gb_shop/providers/Geoubicacion_providers.dart';
import 'package:gb_shop/providers/providers.dart';
import 'package:provider/provider.dart';


void main() => runApp(const AppState());

class MyHttpOverrides extends HttpOverrides {

  @override
  // ignore: override_on_non_overriding_member
  HttpClient createHttpclient(SecurityContext? context) => 
  super.createHttpClient(context)
    ..badCertificateCallback=(cert, host, port) => true;
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

//Consumos
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MultiProvider( 
    providers: [
      
      ChangeNotifierProvider(
        create: (context) => UsuarioProvider(), 
        lazy: false,),

        ChangeNotifierProvider(
        create: (context) => ReporteProvider(), 
        lazy: false,),

        ChangeNotifierProvider(
        create: (context) => EventoProvider(), 
        lazy: false,),

        ChangeNotifierProvider(
        create: (context) => PatrocinadorProvider(), 
        lazy: false,),

        ChangeNotifierProvider(
        create: (context) => GeoubicacionProvider(), 
        lazy: false,),

        ChangeNotifierProvider(
        create: (context) => EtiquetaProvider(), 
        lazy: false,),

        ChangeNotifierProvider(
        create: (context) => FotoProvider(), 
        lazy: false,),


    ], child: const MaterialApp(debugShowCheckedModeBanner: false, home: GbShop()),);
  }
}

class GbShop extends StatefulWidget{
  const GbShop({Key? key}) : super(key: key);

  @override
  // ignore: |, no_logic_in_create_state
  State<GbShop> createState() => _GbShopState();

}


class _GbShopState extends State<GbShop>{
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 1;

  final screens = [
    const MapScreen(),
    const HomeScreen(),
    const AboutScreen()

  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.map, size: 30,),
      const Icon(Icons.home, size: 30,),
      const Icon(Icons.info, size: 30,),
    ];


    return Scaffold(
      backgroundColor: Colors.white,
      
      body: screens[index],
      bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(color: Colors.white)
        ),
        child: CurvedNavigationBar(key: navigationKey, 
        color: Colors.greenAccent,
        backgroundColor: Colors.transparent,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}