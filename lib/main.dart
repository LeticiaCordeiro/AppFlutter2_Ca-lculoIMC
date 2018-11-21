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
      //cor de fundo da tela 
      //corpo do app
      backgroundColor: Colors.white,
      body: Column(
        //alinhar para ocupar toda tela 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline, size:120.0, color: Colors.green),
          //Peso
          TextField(keyboardType:  TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso(Kg)",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
          ),
          //Altura
            TextField(keyboardType:  TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura (cm)",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
          )
        ],
      ),
    );
  }
}
