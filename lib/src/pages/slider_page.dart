import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 300.0;
  bool _checkActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider Page'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _crearCheckbox(),
              _crearSwitch(),
              Expanded(child: _crearImage())
            ],
          ),
        ));
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valueSlider,
      min: 100.0,
      max: 600.0,
      onChanged: !_checkActive
          ? null
          : (value) {
              setState(() {
                _valueSlider = value;
                print(value);
              });
            },
    );
  }

  Widget _crearImage() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage(
          'https://media1.tenor.com/images/f257759005ba5bf4b3d0b43d85cb78f3/tenor.gif?itemid=13677792'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
        title: _checkActive ? Text('Bloquear Slide') : Text('Activar Slide'),
        value: _checkActive,
        onChanged: (value) {
          setState(() {
            _checkActive = value;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: _checkActive ? Text('Bloquear Slide') : Text('Activar Slide'),
        value: _checkActive,
        onChanged: (value) {
          setState(() {
            _checkActive = value;
          });
        });
  }
}
