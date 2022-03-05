import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: GbShop()));
}

class GbShop extends StatefulWidget{
  const GbShop({Key? key}) : super(key: key);

  @override
  State<GbShop> createState() => _GbShopState();
}


class _GbShopState extends State<GbShop>{
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    const HomeScreen(),
    const ReporteScreen(),
    const ConsPOIScreen(),
    const MapScreen(),
    const AboutScreen()

  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30,),
      const Icon(Icons.book, size: 30,),
      const Icon(Icons.point_of_sale, size: 30,),
      const Icon(Icons.map, size: 30,),
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