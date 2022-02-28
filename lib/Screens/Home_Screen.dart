import 'package:flutter/material.dart';
import 'package:gb_shop/routes/app_routes.dart';

 class HomeScreen extends StatelessWidget{

   const HomeScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      final menuOptions = AppRoutes.menuOptions;
      return  Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/TexLogo.png', width: 600, height: 800,),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(menuOptions[index].label),
              leading: Icon(menuOptions[index].icon),
              onTap: (){
                if(menuOptions[index].route == AppRoutes.initialRoute){
                  Navigator.pushReplacementNamed(context, AppRoutes.initialRoute);
                }else{
                   Navigator.pushNamed(context, menuOptions[index].route);
                }
              },
            ), 
            separatorBuilder: (context, index) => const Divider(), 
            itemCount: menuOptions.length)
      );
    }
 }