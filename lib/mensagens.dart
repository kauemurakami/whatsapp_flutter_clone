import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/usuario.dart';

class Mensagem extends StatefulWidget {

  Usuario contato;

  Mensagem(this.contato);

  @override
  _MensagemState createState() => _MensagemState();
}

class _MensagemState extends State<Mensagem> {
  @override
  Widget build(BuildContext context) {

    _enviarFoto(){

    }
    _enviarMensagem(){

    }

    TextEditingController _controllerMensagem = TextEditingController();

    var caixaMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(right: 8),
              child: TextField(
                controller: _controllerMensagem,
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Digite uma mensagem...",
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: _enviarFoto(),
                  )
                ),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff075E54),
            child: Icon(
              Icons.send, color: Colors.white,
            ),
            mini: true,
            onPressed: _enviarMensagem(),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contato.nome),
      ),
      body: Container(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text("x"),
                caixaMensagem,
              ],
            ),
          )
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover
          )
        ),
      ),

    );
  }
}
