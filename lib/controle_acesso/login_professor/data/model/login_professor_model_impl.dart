// To parse this JSON data, do
//
//     final loginProfessorModelImpl = loginProfessorModelImplFromJson(jsonString);


import 'dart:convert';
import '../interfaces/model/i_login_professor_model.dart';
LoginProfessorModelImpl loginProfessorModelImplFromJson(String str) => LoginProfessorModelImpl.fromJson(json.decode(str));

String loginProfessorModelImplToJson(LoginProfessorModelImpl data) => json.encode(data.toJson());

class LoginProfessorModelImpl extends ILoginProfessorModel{
  LoginProfessorModelImpl({
    required this.nome,
    required this.cpf,
  }) : super(nome, cpf);

  String nome;
  String cpf;

  factory LoginProfessorModelImpl.fromJson(Map<String, dynamic> json) => LoginProfessorModelImpl(
    nome: json["nome"],
    cpf: json["cpf"],
  );

  Map<String, dynamic> toJson() => {
    "nome": nome,
    "cpf": cpf,
  };
}
