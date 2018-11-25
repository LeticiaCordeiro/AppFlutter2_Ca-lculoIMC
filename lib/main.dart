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

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  //var de resposta
  String _infoText = "Informe seus dados!";
  //limpar a tela 
  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
        _infoText = "Informe seus dados!!";  
    });
  }
  //calcular 
  void calculate(){
    setState((){
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight/(height * height);
      if(imc < 18.6){
        _infoText = "Abaixo do Peso ( ${imc.toStringAsPrecision(4)} )";
      } else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso ideal ( ${imc.toStringAsPrecision(4)} )";
      }else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente Acima do Peso ( ${imc.toStringAsPrecision(4)} )";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau 1 ( ${imc.toStringAsPrecision(4)} )";
      } else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade Grau 2( ${imc.toStringAsPrecision(4)} )";
      }
      else if(imc >= 40 ){
        _infoText = "Obesidade Grau 3 ( ${imc.toStringAsPrecision(4)} )";
      }
    });
  }

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
            onPressed: _resetFields,
          )
        ]
      ),
      //cor de fundo da tela 
      //corpo do app
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
          //alinhar para ocupar toda tela 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size:120.0, color: Colors.green),
            //Peso
            TextFormField(keyboardType:  TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso(Kg)",
                labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: weightController,
              validator: (value){
                if(value.isEmpty){
                  return "Insira seu Peso!";
                }
              },
            ),
            //Altura
            TextFormField(keyboardType:  TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: heightController,
              validator: (value){
                if(value.isEmpty){
                  return "Insira seu Altura!";
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      calculate();
                    }
                  },
                  child: Text("Calcular", 
                    style: TextStyle(color: Colors.white, fontSize: 25.0)
                  ),
                  color: Colors.green,
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0)
            )
          ],
        ),
        )
      )
    );
  }
}
