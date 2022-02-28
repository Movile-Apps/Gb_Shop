import 'package:flutter/material.dart';
import 'package:gb_shop/Models/item_menu.dart';
import 'package:gb_shop/Screens/LoginScreens.dart';

class AppLoginRoutes{
  static const String initialRoute = 'Login';

  static final menuLoginOptions = <ItemMenu>[
    
    ItemMenu(
    label: 'Inicio', 
    route: initialRoute, 
    icon: Icons.house, 
    screen: const HomeScreen()),

    ItemMenu(
        label: 'Registrarse', 
        route: 'Registro', 
        icon: Icons.person , 
        screen: const RegistroScreen())

    
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for(final item in menuLoginOptions){
      appRoutes.addAll({item.route:(BuildContext context) => item.screen});

    }

    return appRoutes;
  }
}