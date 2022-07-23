import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../data/interfaces/services/i_listar_alunos_services.dart';
import 'listar_alunos_event.dart';
import 'listar_alunos_state.dart';

class ListarAlunosBloc extends Bloc<ListarAlunosEvent, ListarAlunosState> {
  final IListarAlunosServices service;
  ListarAlunosBloc({required this.service}) : super(ListarAlunosState().init()) {
    on<InitEvent>(_init);
    on<CarregandoEvent>(_carregarDados);
    on<EnviandoEvent>(_enviarDados);
  }

  void _init(InitEvent event, Emitter<ListarAlunosState> emit) async {
    emit(state.clone());
  }


  Future _carregarDados(CarregandoEvent event, Emitter<ListarAlunosState> emit) async {

    emit(CarregandoState());
    final alunos = await service.ListarAlunos(idTurma: event.idTurma);
    if(alunos.isRight){
      emit(CarregadoState(alunos: alunos.right));
    }else{emit(ErrorState(message: "Não Encontramos Alunos Cadastrado para turma:"));}
  }

  Future _enviarDados(EnviandoEvent event, Emitter<ListarAlunosState> emit) async {

    Modular.to.pushNamed('./assinatura_aluno?turma=${event.turma}&status=${event.status}',
        arguments:event.aluno );

  }
}
