import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Scaffold para criacao de menu e barra superior e inferior 
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        //Actions -> botões da barra superior
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: (){},
          )
        ]
      ),
    );
  }
}
