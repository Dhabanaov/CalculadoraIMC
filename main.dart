import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main() => runApp(
  MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  String _info = "Informe seus dados.";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  void _resetFields()
  {
      pesoController.text = '';
      alturaController.text = '';
      setState(() {
        _info = "Informe seus dados.";
        _formKey = GlobalKey<FormState>();
      });
  }

  void _calcularMsculino(){
    setState(()
    {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / ( altura * altura);
      print(imc);
      if(imc < 18.6){
        _info = 'Abaixo do Peso (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 18.6 && imc < 24.9){
        _info = 'Peso Ideal (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 24.9 && imc < 29.9){
        _info = 'Levemente Acima do Peso (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 29.9 && imc < 34.9){
        _info = 'Obesidade Grau I (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 34.9 && imc < 39.9){
        _info = 'Obesidade Grau II (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 40){
        _info = 'Obesidade Grau III (${imc.toStringAsPrecision(1)})';
      }

    });
  }
void _calcularFeminnino(){
    setState(()
    {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / ( altura * altura);
      print(imc);
      if(imc < 19.1){
        _info = 'Abaixo do Peso (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 19.1  && imc < 25.8){
        _info = 'Peso Ideal (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 25.9 && imc < 27.3){
        _info = 'Pouco acima do peso (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 27.4 && imc < 32.3){
        _info = 'Obesidade Grau I (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 32.4 && imc < 39.9){
        _info = 'Obesidade Grau II (${imc.toStringAsPrecision(1)})';
      } else if(imc >= 39){
        _info = 'Obesidade Grau III (${imc.toStringAsPrecision(1)})';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120.0, color: Colors.blue),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: pesoController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (CM)",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: alturaController,
                validator: (value){
                  if(value!.isEmpty){
                    
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding(  
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50,
                  child: Center(
                    child: SizedBox(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            _calcularFeminnino();
                          }
                        },
                        
                        child: Text('Mulher',style: TextStyle(color: Colors.white, fontSize: 25.0),),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(  
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50,
                  child: Center(
                    child: SizedBox(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            _calcularMsculino();
                          }
                        },
                        child: Text('Homem',style: TextStyle(color: Colors.white, fontSize: 25.0),),
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ),
              ),

              Text(_info,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue
                , fontSize: 25),
              )
            ],
          ),
        )
      )
    );
  }
}