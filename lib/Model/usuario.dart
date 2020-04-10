import 'package:flutter/material.dart';

class Usuario{

   String _id;
   String _nome;
   String _email;
   String _senha;
   String _urlImagem;

   Map<String, dynamic> toMap(usaurio){
      Map<String,dynamic> map = {
        "nome" : this.nome,
        "email" : this.email,
      };

      return map;
   }

   @protected
   String get id => _id;

   @protected
   set id(String value) {
      _id = value;
   }
   @protected
   String get nome => _nome;

   @protected
   set nome(String value) {
     _nome = value;
   }

   @protected
   String get email => _email;

   @protected
   String get urlImagem => _urlImagem;

   @protected
   set urlImagem(String value) {
     _urlImagem = value;
   }
   @protected
   String get senha => _senha;

   @protected
   set senha(String value) {
     _senha = value;
   }
   @protected
   set email(String value) {
     _email = value;
   }

}