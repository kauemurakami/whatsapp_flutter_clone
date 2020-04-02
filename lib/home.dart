import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsappflutter/abas/contatos.dart';
import 'package:whatsappflutter/abas/conversas.dart';
import 'package:whatsappflutter/configuracoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _tabController;
  List<String> itens = ["Configurações", "Sair"];
  String emailUsuario = "";

  Future _recuperarDadosUsuario() async{

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();

    setState(() {
      emailUsuario = usuarioLogado.email;
    });
  }

  _deslogar(){
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarDadosUsuario();

    _tabController = TabController(
        length: 2,
        vsync: this
    );
  }

  _escolhaMenuItem(String item){
    switch(item){
      case "Configurações" :
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Configuracoes()
          )
        );
        break;
      case "Sair" :
        _deslogar();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          tabs: <Widget>[
            Text("Conversas"),
            Text("Contatos"),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
              itemBuilder: (context){
                return itens.map((String item){
                  return PopupMenuItem<String>(
                    value: item,
                      child: Text(item),
                  );
                }).toList();
              },
            onSelected: _escolhaMenuItem,
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
          children: <Widget>[
            AbaConversas(),
            AbaContatos()
          ],
      ),
    );
  }
}
