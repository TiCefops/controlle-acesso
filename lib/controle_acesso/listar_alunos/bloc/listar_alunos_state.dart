import 'package:equatable/equatable.dart';

import '../data/interfaces/entity/listar_alunos_entity.dart';

class ListarAlunosState extends Equatable {
  ListarAlunosState init() {
    return ListarAlunosState();
  }

  ListarAlunosState clone() {
    return ListarAlunosState();
  }
  @override
  List<Object> get props {
    return [];
  }
}
class CarregandoState extends ListarAlunosState{}

class ErrorState extends ListarAlunosState{
  final String message;

  ErrorState({required this.message});
}
class CarregadoState extends ListarAlunosState{
  final List<ListarAlunosEntity> alunos;

  CarregadoState({required this.alunos});
}
