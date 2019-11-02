import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          _cardTipoUno(),
          SizedBox(height: 30.0,),          
          _cardTipoDos(),
          
        ],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Non id dolor amet duis excepteur cupidatat do.'),
            subtitle: Text('Exercitation reprehenderit amet sit duis ut aliquip laboris nisi ea excepteur. Excepteur voluptate voluptate ipsum exercitation eu voluptate excepteur do voluptate proident ad dolore exercitation.'),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {},
                )
              ],
            )
          ),          
        ],
      ),
    );
  }

  Widget _cardTipoDos(){
    final card = Container(
      color : Colors.white,
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/8/81/Parque_Eagle_River%2C_Anchorage%2C_Alaska%2C_Estados_Unidos%2C_2017-09-01%2C_DD_02.jpg"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),          
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Incididunt ea eiusmod aliquip anim enim sint quis do ut fugiat est.'))
        ],
      ),
    );

    return Container(    
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0)
          )
        ],
        borderRadius: BorderRadius.circular(20.0),        
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}