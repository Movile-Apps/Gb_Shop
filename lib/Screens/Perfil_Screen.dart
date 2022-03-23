import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
      // final ReporteProvider = Provider.of(context);
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
                  children: [
                    _cardName(),
                    _cardCorreo(),
                    _cardPass(),
                  ],
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
                    color: Color.fromARGB(255, 90, 202, 236),
                              onPressed: (){}
                    ),

                    IconButton(
                    icon: const Icon(Icons.logout),
                    color: Color.fromARGB(255, 228, 62, 32),
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                              }
                    ),

                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Color.fromARGB(255, 248, 39, 39),
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

  Widget _cardName() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(5),

    elevation: 5,
    child: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Nombre:'),
          subtitle: Text('Cauich Colli Rafael.'),leading: 
          Icon(Icons.personal_injury, color: Color.fromARGB(255, 125, 235, 82) )),
     ],
    ),
   );
  }

Widget _cardCorreo() {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(5),

      elevation: 5,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Correo electronico:'),
            subtitle: Text('xxrafafloxx@gmail.com'),leading: 
            Icon(Icons.mail_sharp, color: Color.fromARGB(255, 125, 235, 82) )),
        ],
      ),
    );
  }

  Widget _cardPass() {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(5),

      elevation: 5,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Contraseña:'),
            subtitle: Text('123456789'),leading: 
            Icon(Icons.key_rounded, color: Color.fromARGB(255, 125, 235, 82) )),
        ],
      ),
    );
  }

}

