import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/listar_alunos_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ListarAlunosEvent extends Equatable {
  const ListarAlunosEvent();

  @override
  List<Object> get props {
    return [];
  }
}
class InitEvent extends ListarAlunosEvent {}

class CarregandoEvent extends ListarAlunosEvent {
  final String idTurma;

  const CarregandoEvent({required this.idTurma});
}

class ErroEvent extends ListarAlunosEvent {}

class CarregadoEvent extends ListarAlunosEvent {}

class EnviandoEvent extends ListarAlunosEvent {
  final ListarAlunosEntity aluno;
  final String turma;
  final String status;

  const EnviandoEvent(this.aluno, this.turma, this.status);
}



