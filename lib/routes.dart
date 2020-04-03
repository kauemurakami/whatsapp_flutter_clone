import 'package:flutter/material.dart';
import 'package:whatsappflutter/cadastro.dart';
import 'package:whatsappflutter/login.dart';
import 'home.dart';

class RouteGenerator{

  static const String ROUTE_ROOT = "/";
  static const String ROUTE_HOME = "/home";
  static const String ROUTE_SIGNUP = "/signup";
  static const String ROUTE_SIGNIN = "/login";

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case ROUTE_ROOT:
        return MaterialPageRoute(
          builder: (_) => Login()
        );

      case ROUTE_HOME:
        return MaterialPageRoute(
          builder: (_) => Home()
        );

      case ROUTE_SIGNIN:
        return MaterialPageRoute(
            builder: (_) => Login()
        );

      case ROUTE_SIGNUP:
        return MaterialPageRoute(
            builder: (_) => Cadastro()
        );

        default:
          _erroRota();

    }

  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text("Tela não encontrada"),
          ),
          body: Center(
            child: Text("Tela não encontrada"),
          ),
        );
      }
    );
  }

}