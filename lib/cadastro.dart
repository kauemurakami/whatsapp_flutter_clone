import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  validarCampos() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if(email.contains("@") && email.isNotEmpty){
      if(nome.length >= 3 ){
        if(senha.isNotEmpty){
          setState(() {
            _mensagemErro = "";
          });

        }else{
          setState(() {
            _mensagemErro = "Insira sua senha";
          });
        }
      }else{
        setState(() {
          _mensagemErro = "Nome precisa ser maior que 3 caracteres";
        });
      }
    }else {
      setState(() {
        _mensagemErro = "Preencha com um email valido";
      });
    }
  }

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
                  padding: EdgeInsets.only(bottom: 16),
                  child: Image.asset("images/usuario.png",
                    width: 200,
                    height: 150,),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                  padding: EdgeInsets.only(top: 8, bottom: 16),
                  child: TextField(
                    obscureText: true,
                    controller: _controllerSenha,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                  padding: EdgeInsets.only(bottom: 16),
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
                    onPressed: () {
                      validarCampos();
                    },
                  ),
                ),
                Center(
                  child: Text(
                      _mensagemErro,
                      style: TextStyle(
                          color: Colors.red
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  }
