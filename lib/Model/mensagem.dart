import 'package:flutter/material.dart';

class Mensagem{

  String _idUsuario;
  String _mensagem;
  String _urlImagemMensagem;

  //define o tipo da mensagem texto ou imagem
  String _tipo;


  Mensagem();


  Map<String, dynamic> toMap(){
    Map<String,dynamic> map = {
      "idUsuario" : this._idUsuario,
      "mensagem" : this._mensagem,
      "urlImagem" : this._urlImagemMensagem,
      "tipo" : this._tipo
    };

    return map;
  }

  @protected
  String get tipo => _tipo;

  @protected
  set tipo(String value) {
    _tipo = value;
  }

  @protected
  String get urlImagemMensagem => _urlImagemMensagem;

  @protected
  set urlImagemMensagem(String value) {
    _urlImagemMensagem = value;
  }

  @protected
  String get mensagem => _mensagem;

  @protected
  set mensagem(String value) {
    _mensagem = value;
  }

  @protected
  String get idUsuario => _idUsuario;

  @protected
  set idUsuario(String value) {
    _idUsuario = value;
  }
}