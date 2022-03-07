import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/Screens.dart';

 class ReporteScreen extends StatelessWidget{

   const ReporteScreen ({Key? key}) : super(key : key);
   
    @override
    Widget build(BuildContext context) {
      return  SafeArea(
      child: 
      Scaffold(
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
          title: Image.asset('assets/TexLogoRep.png', width: 200, height: 400,),
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
            
            children: [
              Flexible(
                child: Image.asset('assets/LogReporte.png',
                height: 300.0,
                ),
              ),
              
              _desclugarTextField(),
              const SizedBox(height: 20.0,),
              _desTextField(),
              const SizedBox(height: 15,),
              _bottonImage(),          
              _bottonCrear(),
            ],
          )

        ),
      );
  }

  Widget _desTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(

            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(

              icon: Icon(Icons.phone_callback),
              hintText: 'Selecciona el motivo',
              labelText: 'Motivo de denuncia.'
            ),

          ),
        );
      }
    );
  }

  

  Widget _desclugarTextField() {
      return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(
            
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              icon: Icon(Icons.table_rows),
              hintText: 'Cuentanos que problema tiene el lugar.',
              labelText: 'Descripcion del lugar.'
            ),
          ),
        );
      }
    );
  }

Widget _bottonImage() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Seleccionar foto',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 10.0,
        color: const Color.fromARGB(255, 148, 240, 163),
        splashColor: const Color.fromARGB(255, 245, 229, 85),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
         }
       );
      }
    );
  }

  Widget _bottonCrear() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Crear reporte',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 10.0,
        color: Colors.amber,
        splashColor: const Color.fromARGB(255, 99, 223, 245),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
        }
      );
      }
    );
  }


  

}

  
  
