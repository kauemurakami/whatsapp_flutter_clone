import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {

  TextEditingController _controllerNome = TextEditingController();
  File _imagem;
  String _idUsuario;
  bool _uploadImg = false;
  String _urlImgRecuperada;
  
  Future _recuperarImagem(String origemDaImagem) async{

    File imagemSelecionada;

    switch(origemDaImagem){
      case "camera" :
        imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
        break;
      case "galeria" :
        imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
        break;
    }

    setState(() {
      _imagem = imagemSelecionada;
      if(_imagem != null){
        _uploadImg = true;
        _uploadImagem();
      }
    });
  }

  Future _uploadImagem(){
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference raiz = storage.ref();
    StorageReference arquivo = raiz
    .child("perfil")
    .child(_idUsuario+".jpg");

    StorageUploadTask task = arquivo.putFile(_imagem);

    task.events.listen((StorageTaskEvent storageEvent){
      if(storageEvent.type == StorageTaskEventType.progress){
        setState(() {
          _uploadImg = true;
        });
      }else if(storageEvent.type == StorageTaskEventType.success){
        setState(() {
          _uploadImg = false;
        });
      }
    });

    task.onComplete.then((StorageTaskSnapshot snapshot){
      _urlImg(snapshot);

    });

  }
  //recuperando url imagem
  Future _urlImg(StorageTaskSnapshot snapshot) async{
    String url = await snapshot.ref.getDownloadURL();
    _atualizarImagemFirestore(url);
    setState(() {
      _urlImgRecuperada = url;
    });
    
  }
  _atualizarNomeFirestore(String nome){
    Firestore db = Firestore.instance;

    Map<String, dynamic> dadosAtualizar = {
      "nome" : nome
    };
    db.collection("usuarios")
    .document(_idUsuario)
    .updateData(dadosAtualizar);
  }

  _atualizarImagemFirestore(String url){
    Firestore db = Firestore.instance;

    Map<String, dynamic> dadosAtualizar = {
      "urlImagem" : url
    };
    db.collection("usuarios")
        .document(_idUsuario)
        .updateData(dadosAtualizar);
  }

  _recuperaDadosUsuario() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _idUsuario = usuarioLogado.uid;

    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").document(_idUsuario).get();

    Map<String, dynamic> dados = snapshot.data;
    _controllerNome.text = dados["nome"];

    if(dados["urlImagem"] != null ){
      _urlImgRecuperada = dados["urlImagem"];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperaDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: _uploadImg ? CircularProgressIndicator() : Container(),
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey,
                  backgroundImage: _urlImgRecuperada != null ? NetworkImage(_urlImgRecuperada) : null
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Camera"),
                      onPressed: (){
                        _recuperarImagem("camera");
                      }
                    ),
                    FlatButton(
                      child: Text("Galeria"),
                      onPressed: (){
                        _recuperarImagem("galeria");
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    onChanged: (texto){
                      _atualizarNomeFirestore(texto);
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                          color: Colors.black
                      ),
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: RaisedButton(
                    child: Text(
                      "Salvar",
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
                      _atualizarNomeFirestore(_controllerNome.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
