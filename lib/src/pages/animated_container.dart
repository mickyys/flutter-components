import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),                    
        ),        
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon (Icons.play_arrow),
          onPressed: () => _changeColorAndSize(),
      ),      
    );
  }

  void _changeColorAndSize() {  
    
    final random = Random();

    setState(() {
      this._width = random.nextInt(300).toDouble();
      this._heigth = random.nextInt(300).toDouble();
      this._color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1); 
      this._borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}