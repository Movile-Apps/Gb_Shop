import 'package:flutter/material.dart';
import 'package:gb_shop/Models/item_menu.dart';
import 'package:gb_shop/Screens/screens.dart';

class AppRoutes{
  static const String initialRoute = 'Home';

  static final menuOptions = <ItemMenu>[
    
    ItemMenu(
    label: 'Inicio', 
    route: initialRoute, 
    icon: Icons.house, 
    screen: const HomeScreen()),

    ItemMenu(
    label: 'Crear reporte', 
    route: 'Reporte', 
    icon: Icons.monitor, 
    screen: const ReporteScreen()),

    ItemMenu(
    label: 'Consultar POI', 
    route: 'ConsPOI', 
    icon: Icons.tab_outlined, 
    screen: const ConsPOIScreen()),

    ItemMenu(label: 'Registrarse', 
        route: 'Registro', 
        icon: Icons.person , 
        screen: const RegistroScreen()),

    ItemMenu(label: 'Iniciar sesion', 
        route: 'Login', 
        icon: Icons.person_search , 
        screen: const LoginScreen()),

    ItemMenu(
        label: 'Sobre nosotros', 
        route: 'About', 
        icon: Icons.info, 
        screen: const AboutScreen())

  ];

  static Map<String, Widget Function(BuildContext)> getRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for(final item in menuOptions){
      appRoutes.addAll({item.route:(BuildContext context) => item.screen});

    }

    return appRoutes;
  }
}