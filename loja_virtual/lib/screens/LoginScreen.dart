import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: [
          FlatButton(
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(
                fontSize: 15
              ),
            ),
            textColor: Colors.white,
            onPressed: (){},
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "E-mail"
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text.isEmpty || !text.contains("@")) return "E-mail inválido!"; else return null;
              },
            ),
            SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
              obscureText: true,
              validator: (text){
                if(text.isEmpty || text.length < 6) return "senha inválida!"; else return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: (){},
                child: Text(
                    "Esqueci a minha senha",
                    textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 16,),
            SizedBox(
              height: 44,
              child: RaisedButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}