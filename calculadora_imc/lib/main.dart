import 'package:flutter/cupertino.dart';
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
  TextEditingController _weitghtController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  String _textInfo = "Informe seus dados";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields(){
    _weitghtController.text = "";
    _heightController.text = "";
    setState(() {
      _textInfo = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate(){
    setState(() {
      double weitght = double.parse(_weitghtController.text);
      double height = double.parse(_heightController.text) / 100;
      double imc = weitght / (height * height);

      if(imc < 18.6){
        _textInfo = " Abaixo do peso (${imc.toStringAsPrecision(2)})";
      }else if( imc >= 18.6 && imc < 24.9 ){
        _textInfo = " Peso ideal (${imc.toStringAsPrecision(2)})";
      }else if(imc >= 24.9 && imc < 29.9){
        _textInfo = " Levemente Acima do Peso (${imc.toStringAsPrecision(2)})";
      }else if(imc >= 24.9 && imc < 34.9){
        _textInfo = " Obesidade Grau I(${imc.toStringAsPrecision(2)})";
      }else if(imc >= 34.9 && imc < 39.9){
        _textInfo = " Obesidade Grau II(${imc.toStringAsPrecision(2)})";
      }else if(imc >= 40){
        _textInfo = " Obesidade Grau III(${imc.toStringAsPrecision(2)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                  Icons.person_outline,
                  size: 120,
                  color: Colors.green
              ),
              TextFormField(
                controller: _weitghtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25
                ),
                // ignore: missing_return
                validator: (value){
                  if(value.isEmpty){
                    return "Insira seu peso";
                  }
                },
              ),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25
                ),
                // ignore: missing_return
                validator: (value){
                  if(value.isEmpty){
                    return "Insira sua altura";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child:  Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _calculate();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                _textInfo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25
                ),
              )
            ],
          ),
        )
      )
    );
  }
}