import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';

import '../main.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
      //final usuario = usuarioProvaider.getbyid(1)

      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Mi perfil'),
          elevation: 0,
        centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                _perfilimage(),
                Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                       const ListTile(
                        leading: Icon(Icons.person_pin, color: Color.fromARGB(255, 132, 236, 123)),
                        title: Text('Datos personales:', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),),
                      const Text('Nombre completo: Rafael Cauich Colli', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                      const Text('Email: xxrafafloxx@gmail.com', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                      const Text('Contraseña: *********', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                      Container(
                        alignment: Alignment.center,
                      ) ,
                    ],
                  ),
                ),


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 247, 215, 87)
                          ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: const Text('Consultar mis reportes',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ), 
                            ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConsPOIScreen(),));
                          }
                    ),   
              ],    
            ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [

                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: const Color.fromARGB(255, 90, 202, 236),
                              onPressed: (){}
                    ),

                    IconButton(
                    icon: const Icon(Icons.logout),
                    color: const Color.fromARGB(255, 228, 62, 32),
                              onPressed: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                              }
                    ),

                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: const Color.fromARGB(255, 248, 39, 39),
                      onPressed: (){
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('¿Estás seguro?'),
                            content: const Text('Tu perfil será eliminado para siempre... (eso es mucho tiempo)'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                                }
                                ,child: const Text('Confirmar'),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                ],),
             ]
            )
            ]
          )
        )
      )
      );
    }

  Widget _perfilimage(){
  return Container(
     width: 190.0,
     height: 190.0,
     decoration: const BoxDecoration(
         shape: BoxShape.circle,
         image: DecorationImage(
             fit: BoxFit.fill,
             image: NetworkImage("https://e.rpp-noticias.io/normal/2022/03/30/375337_1239610.jpg")
        )
      )
    );
  }



}

