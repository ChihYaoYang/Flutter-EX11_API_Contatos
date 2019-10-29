import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class PersonHelper {
  static final PersonHelper _instance = PersonHelper.internal();

  factory PersonHelper() => _instance;

  PersonHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbPerson = await databases.db;
    dbPerson.close();
  }
}

class Person {
  dynamic id;
  String nome;
  String telefone;
  dynamic usuario_id;

  Person({this.id, this.nome, this.telefone, this.usuario_id});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      nome: json['nome'],
      telefone: json['telefone'],
      usuario_id: json['usuario_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    return data;
  }

  @override
  String toString() {
    return "Person(id: $id, nome: $nome, telefone: $telefone, usuario_id: $usuario_id)";
  }
}
