// To parse this JSON data, do
//
//     final listarTurmasModelImpl = listarTurmasModelImplFromJson(jsonString);

import 'package:cefops_controll_acess/controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ListarTurmasModelImpl listarTurmasModelImplFromJson(String str) => ListarTurmasModelImpl.fromJson(json.decode(str));

String listarTurmasModelImplToJson(ListarTurmasModelImpl data) => json.encode(data.toJson());

class ListarTurmasModelImpl extends IListarTurmasEntity {
  ListarTurmasModelImpl({
    required this.nome,
    required this.id,
    required this.status,
  }) : super(nome, id, status);

  String nome;
  String id;
  bool status;

  factory ListarTurmasModelImpl.fromJson(Map<String, dynamic> json) => ListarTurmasModelImpl(
    nome: json["nome"],
    id: json["id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "nome": nome,
    "id": id,
    "status": status,
  };
}
