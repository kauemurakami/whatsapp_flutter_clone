import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  vaiPorra(){
    Firestore.instance
        .collection("usuarios")
        .document("001")
        .setData({"nome" : "Kauaê"});
  }

  @override
  Widget build(BuildContext context) {


    return Container( );
  }
}
