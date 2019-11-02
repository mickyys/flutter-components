import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        fetchData();
      }       
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ), 
      floatingActionButton: _crearButton(),
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'), 
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10(){
    for (var i = 1; i < 10; i++) {
       _ultimoItem++;
       _listaNumeros.add(_ultimoItem); 
    }
    setState(() {});
  }

  Widget _crearButton() {
    return FloatingActionButton(
      child: Icon(Icons.local_activity),
      onPressed: () => _agregar10(),
    );
  }

  Future fetchData() async {
      isLoading = true;
      setState(() {});
      new Timer(new Duration(seconds: 2) , responseHttp);
  }

  void responseHttp(){
    isLoading = false;
    _scrollController.animateTo(
       _scrollController.position.pixels + 100,
       curve: Curves.fastLinearToSlowEaseIn,
       duration: Duration(milliseconds: 250)
    );
    _agregar10();
  }

  _crearLoading() {
    if(isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
          ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }else{
      return Container();
    }
  }
}