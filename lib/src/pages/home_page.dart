import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body : _lista(),
    );
  }

  Widget _lista() {    
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder : (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listaItems(context, snapshot.data),
        );
      }
    );    
  }

  List<Widget> _listaItems(BuildContext context, List<dynamic> opciones) {
    return opciones.map((opcion){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opcion['texto']),
            leading:  getIcon(opcion['icon']),
            trailing: Icon(Icons.arrow_right, color : Colors.green),
            onTap: (){
              Navigator.pushNamed(context, opcion['ruta']);
            },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}