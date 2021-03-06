import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsappflutter/routes.dart';
import 'Model/usuario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if(email.contains("@") && email.isNotEmpty){
        if(senha.isNotEmpty && senha.length > 5){
          setState(() {
            _mensagemErro = "";
          });

          Usuario usuario = Usuario();
          usuario.email = email;
          usuario.senha = senha;
          _logarUsuario(usuario);
        }else{
          setState(() {
            _mensagemErro = "Insira sua senha";
          });
        }
    }else {
      setState(() {
        _mensagemErro = "Preencha com um email valido";
      });
    }
  }

  _logarUsuario(Usuario usuario){

    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((firabaseUser){

      Navigator.pushReplacementNamed(context, RouteGenerator.ROUTE_HOME);

    }).catchError((onError){
      setState(() {
        _mensagemErro = "Erro ao autenticar usuário";
      });
    });

  }

  Future _verificaUsuarioLogado() async{
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser usuarioLogado = await auth.currentUser();

    if( usuarioLogado != null ){

      Navigator.pushReplacementNamed(context, RouteGenerator.ROUTE_HOME);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _verificaUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Image.asset("images/logo.png",
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
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: TextField(
                    controller: _controllerSenha,
                    obscureText: true,
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
                      "Entrar",
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
                      _validarCampos();
                    },
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                        "Não tem conta? Cadastre-se",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacementNamed(context, RouteGenerator.ROUTE_SIGNUP);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                        _mensagemErro,
                        style: TextStyle(
                            color: Colors.red
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
