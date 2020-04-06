import 'package:flutter/material.dart';
import 'package:whatsappflutter/Model/conversa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsappflutter/Model/usuario.dart';

class AbaContatos extends StatefulWidget {
  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {

  List<Conversa> conversas = [
    Conversa(
        "Luiza",
        "ola",
        "https://firebasestorage.googleapis.com/v0/b/wpp-flutter.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=c3794c9d-16b6-433e-81a2-0d27eab73b95"
    ),
    Conversa(
        "Olavo",
        "opa",
        "https://firebasestorage.googleapis.com/v0/b/wpp-flutter.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=73f601a3-5e19-4d07-8c1d-0c54d3af92c9"
    ),
    Conversa(
        "Joao",
        "Manda o nome daquela seria",
        "https://firebasestorage.googleapis.com/v0/b/wpp-flutter.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=af01eeca-1474-4b15-94e9-429d97d57458"
    ),
    Conversa(
        "Jamilton",
        "Qual a resposta da 2",
        "https://firebasestorage.googleapis.com/v0/b/wpp-flutter.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=d45a04c6-2ed9-4360-af58-d12ace1198ce"
    )
  ];

  Future<List<Usuario>> _recuperaContatos() async{

    Firestore db = Firestore.instance;
    QuerySnapshot snapshot = await db.collection("usaurios")
    .getDocuments();

    List<Usuario> usuarios = List();
    for(DocumentSnapshot item in snapshot.documents){
      var dados = item.data;
      Usuario usuario = Usuario();
      usuario.email = dados["email"];
      usuario.nome = dados["nome"];
      usuario.urlImagem = dados["urlImagem"];

      usuarios.add(usuario);
    }
    return usuarios;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Usuario>>(
      future: _recuperaContatos(),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                children: <Widget>[
                  Text("Carregando"),
                  CircularProgressIndicator()
                ],
              ),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                List<Usuario> listaItens = snapshot.data;
                Usuario usuario = listaItens[index];
                return ListTile(

                );
              },

            );
            break;
        }
      },
    );
}
