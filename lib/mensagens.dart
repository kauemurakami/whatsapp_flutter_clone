import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Model/mensagem.dart';
import 'Model/usuario.dart';

class Mensagens extends StatefulWidget {

  Usuario contato;

  Mensagens(this.contato);

  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {

  TextEditingController _controllerMensagem = TextEditingController();
  String _idUsuarioLogado;
  String _idUsuarioDestinatario;

  _recuperaDadosUsuario() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _idUsuarioLogado = usuarioLogado.uid;
    _idUsuarioDestinatario = widget.contato.id;
  }

  _salvarMensagem(String idRemetente, String idDestinatario, Mensagem mensagem) async{

    Firestore db = Firestore.instance;
    await db.collection("mensagens")
    .document(idRemetente)
    .collection(idDestinatario)
    .add(mensagem.toMap());

    _controllerMensagem.clear();
  }
  _enviarFoto(){

  }
  _enviarMensagem(){

    String textoMensagem = _controllerMensagem.text;
    if(textoMensagem.isNotEmpty){

      Mensagem mensagem = Mensagem();
      mensagem.idUsuario = _idUsuarioLogado;
      mensagem.mensagem = textoMensagem;
      mensagem.tipo = "texto";
      mensagem.urlImagemMensagem = "";

      _salvarMensagem(_idUsuarioLogado, _idUsuarioDestinatario, mensagem);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _recuperaDadosUsuario();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    List<String> listaMensagens = [
      "oi",
      "oooolaaa",
      "tudo bem ?",
      "sim simsim efwfwf",
    ];
    var listView = Expanded(
      child: ListView.builder(
          itemBuilder: (context, index){
            double larguraContainer = MediaQuery.of(context).size.width * 0.80;
            //definir cores e alinhamentos
            Alignment alinhamento = Alignment.centerRight;
            Color cor = Color(0xffd2ffa5);
            if(index % 2 == 0){
              cor = Colors.white;
              alinhamento = Alignment.centerLeft;
            }
            return Align(
              alignment: alinhamento,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  width: larguraContainer,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cor,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Text(
                      listaMensagens[index],
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ),
              ),
            );
          },
        itemCount: listaMensagens.length,
      ),
    );

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
        title: Row(
          children: <Widget>[
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: widget.contato.urlImagem != null
              ? NetworkImage(widget.contato.urlImagem)
              : null
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(widget.contato.nome)
            )
          ],
        ) ,
      ),
      body: Container(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                listView,
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
