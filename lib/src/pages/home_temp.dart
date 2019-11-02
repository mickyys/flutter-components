import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
      );
  }

  List<Widget> _crearItemsCorta(){
    return opciones.map((opcion){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opcion + " !"),
            subtitle: Text('subtitulo opcion'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }

}