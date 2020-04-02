import 'package:flutter/material.dart';
import 'package:whatsappflutter/Model/conversa.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversas.length,
      itemBuilder: (context, index){
        Conversa conversa = conversas[index];
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 8, 8, 16),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(conversa.caminhoFoto),
          ),
          title: Text(
            conversa.nome,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        );
      },
    );
  }
}
