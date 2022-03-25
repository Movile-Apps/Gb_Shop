import 'dart:ffi';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:gb_shop/Screens/screens.dart';
import 'package:gb_shop/main.dart';
//import 'package:gb_shop/providers/users_provider.dart';
//import 'package:provider/provider.dart';
//import '../Models/usuario.dart';

 class HomeScreen extends StatelessWidget{

   const HomeScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      //final userProvider = Provider.of<UsersProvider>(context);
      //final List<Usuario> usuarios = userProvider.usuarios;

      final List<String> motivodenuncias = [
        'Puntos de interés',
        'Eventos de limpieza'
      ];
      return  Scaffold(
          appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_rounded),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PerfilScreen(),));
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
            },
          ),
        ],
          title: Image.asset('assets/Uso/TexLogo.png', width: 600, height: 800,),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
               
                 //Mockaroo              
                //...usuarios.map((usuario) => ListTile(
                 // title: Text('Nombre completo ${usuario.nombre} ${usuario.apellido}'),
                  //subtitle: Text('Correo ${usuario.correo}'))),
                _crearCardPrincipal(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 235, 233, 225)
                      ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          child: const Text('Crear reporte',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ReporteScreen(),));
                      }
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 235, 233, 225)
                          ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: const Text('Consultar POIs',
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
            Column(
              children: [
                 DropdownButtonFormField(
                    hint: const Text('Selecciona una opción'),
                    icon: const Icon(Icons.card_membership),
                    items: motivodenuncias
                    .map((motivodenuncia) => 
                    DropdownMenuItem(child: Text(motivodenuncia), value: motivodenuncia.toLowerCase()))
                    .toList(), onChanged: (String? value) {  },),
                    Container(
                      padding: const EdgeInsets.all(15.0),),

                  _miPOI(),
                  _miPOI(),
                  _miPOI(),
              ],
            ),

            SizedBox(
                height: 230,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    child: Image.asset('assets/gif/map.gif',fit: BoxFit.cover,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute( builder: (context) => const GbShop()));},
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
              ),
            ),
          ],
         )
        )
      ),
     );
  }
/*Widgets*/
    Widget _crearCardPrincipal() {
   return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(
        children: <Widget>[
          Image.asset('assets/Uso/Portada.png', height: 170.0,),
          Container(
            padding: const EdgeInsets.all(10.0),
          ),
        ],
      ),
     )
    );
  }
  

   Widget _miPOI() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(2),

    elevation: 1,
    child: Column(
      children: <Widget>[
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Punto de interés'),
          subtitle: Text('Calle 111b x 52 y 52 A, Colonia Mercedes Barrera. Exceso de basura.'),leading: 
          Icon(Icons.zoom_in_map, color: Color.fromARGB(255, 115, 209, 233) )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton.icon(icon: const Icon(Icons.visibility, size: 20.0, color: Color.fromARGB(255, 123, 236, 221)),
                  label: const Text('Visitar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                  onPressed: () {
                  
                  },
                ),
            TextButton.icon(icon: const Icon(Icons.confirmation_num, size: 20.0, color: Color.fromARGB(255, 121, 241, 74)),
                  label: const Text('Confirmar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                  onPressed: () {
                  ('Confirmación');},
                ),

            TextButton.icon(icon: const Icon(Icons.remove_circle, size: 20.0, color: Color.fromARGB(255, 240, 68, 68)),
                  label: const Text('Rechazar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                  onPressed: () {
                  ('Rechazo');},
                  ),
            ],
          ),

        ],
      ),
    );
  }
}