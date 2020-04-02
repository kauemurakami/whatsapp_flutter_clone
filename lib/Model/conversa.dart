 import 'package:flutter/cupertino.dart';

class Conversa {
   String _nome;
   String _mensagem;
   String _caminhoFoto;


   Conversa(this._nome, this._mensagem, this._caminhoFoto);

   String get nome => _nome;

   @protected
   set nome(String value) {
     _nome = value;
   }

   String get mensagem => _mensagem;

   String get caminhoFoto => _caminhoFoto;

   @protected
   set caminhoFoto(String value) {
     _caminhoFoto = value;
   }

   @protected
   set mensagem(String value) {
     _mensagem = value;
   }


 }