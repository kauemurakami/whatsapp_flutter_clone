import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xff075E54)
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/usuario.png",
                    width: 200,
                    height: 150,),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      contentPadding: EdgeInsets.fromLTRB(24,16, 16, 24),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      contentPadding: EdgeInsets.fromLTRB(24,16, 16, 24),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      contentPadding: EdgeInsets.fromLTRB(24,16, 16, 24),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: RaisedButton(
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    color: Colors.green,
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    onPressed: (){

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
