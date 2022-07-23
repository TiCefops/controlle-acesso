

import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/data/interface/entity/assinatura_aluno_enity.dart';

import 'dart:convert';

AssinaturaAlunoModel assinaturaAlunoModelFromJson(String str) => AssinaturaAlunoModel.fromJson(json.decode(str));

String assinaturaAlunoModelToJson(AssinaturaAlunoModel data) => json.encode(data.toJson());

class AssinaturaAlunoModel extends AssinaturaAlunoEntity {
  AssinaturaAlunoModel({
   required this.alunoId,
   required this.hospitalId,
   required this.horaAssinatura,
   required this.tipoEntrada,
   required this.assinaturaAluno,
  }) : super(alunoId, hospitalId, horaAssinatura, tipoEntrada, assinaturaAluno);

  String alunoId;
  String hospitalId;
  String horaAssinatura;
  String tipoEntrada;
  String assinaturaAluno;

  factory AssinaturaAlunoModel.fromJson(Map<String, dynamic> json) => AssinaturaAlunoModel(
    alunoId: json["alunoId"],
    hospitalId: json["hospitalId"],
    horaAssinatura: json["horaAssinatura"],
    tipoEntrada: json["tipoEntrada"],
    assinaturaAluno: json["assinaturaAluno"],
  );

  Map<String, dynamic> toJson() => {
    "alunoId": alunoId,
    "hospitalId": hospitalId,
    "horaAssinatura": horaAssinatura,
    "tipoEntrada": tipoEntrada,
    "assinaturaAluno": assinaturaAluno,
  };
}
