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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contato.nome),
      ),
      body: Container(),

    );
  }
}
