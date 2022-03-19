import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
            },
          ),
        ],
          title: const Text('Perfil  de Usuario'),
          elevation: 0,
        centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                _perfilimage(),
                Column(
                  children: [
                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 236, 23, 23)
                      ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          child: const Text('Eliminar perfil',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                                }
                                ,child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                  ],
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
             image: NetworkImage("https://i.imgur.com/BoN9kdC.png")
        )
      )
    );
  }
}

