import 'dart:ffi';
import 'package:gb_shop/Screens/screens.dart';
import 'package:gb_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:gb_shop/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:gb_shop/Models/ResponseList.dart' as response;

 class HomeScreen extends StatelessWidget{

   const HomeScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      //Lista
      final eventoProvider = Provider.of<EventoProvider>(context);
      final response.ResponseList evento = eventoProvider.request;
      //final geoUbiProvider = Provider.of<GeoubicacionProvider>(context);
      //final ResponseList geoubi = geoUbiProvider.request;

      return  Scaffold(
          appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_rounded),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PerfilScreen(),));
            },
          ),
          //Pruebas
          IconButton(
            icon: const Icon(Icons.extension_sharp),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
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
                   _What(),
                      ...?evento.data?.map((evento) => Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.all(5),
                            elevation: 5,
                            child: Column(
                                       children: <Widget>[
                                   ListTile(
                                    contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
                                    title: const Text('Evento de limpieza'),
                                    subtitle: Text('Problema: ${evento.descripcion} Fecha: ${evento.fecha} Ubicación: ${evento.geoubicacionRequest?.latitud}, ${evento.geoubicacionRequest?.longitud} Personas requeridas: ${evento.personasRequeridas}'),
                                    leading: const Icon(Icons.gpp_maybe_sharp, color: Color.fromARGB(255, 40, 199, 133) )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton.icon(icon: const Icon(Icons.airlines_outlined, size: 20.0, color: Color.fromARGB(255, 132, 236, 123)),
                                            label: const Text('Acciones:', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                                            onPressed: () {
                                            ('Confirmación');},
                                          ),
                                      TextButton.icon(icon: const Icon(Icons.confirmation_num, size: 20.0, color: Color.fromARGB(255, 121, 241, 74)),
                                            label: const Text('Confirmar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                                            onPressed: () {
                                            ('Confirmación');},
                                                  )        ,
        
                                      TextButton.icon(icon: const Icon(Icons.remove_circle, size: 20.0, color: Color.fromARGB(255, 240, 68, 68)),
                                            label: const Text('Rechazar', style: TextStyle(color: Color.fromARGB(255, 0, 2, 3), ),),
                                            onPressed: () {
                                            ('Rechazo');},
                                          ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          )
                      //
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
  Widget _What() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(5),
    elevation: 0,
    child: Column(
      children: <Widget>[
        Image.asset('assets/Uso/Eventos.png', width: 350,),

      ],
    ),
  );
  }
  
}