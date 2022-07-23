import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../data/interface/services/i_assinatura_aluno_service.dart';
import 'event.dart';
import 'state.dart';

class AssinaturaAlunoBloc extends Bloc<AssinaturaAlunoEvent, AssinaturaAlunoState> {
  final IAssinaturaAlunoService service;
  AssinaturaAlunoBloc(this.service) : super(AssinaturaAlunoState().init()) {
    on<InitEvent>(_init);
    on<SendEvent>(_enviarDados);
  }

  void _init(InitEvent event, Emitter<AssinaturaAlunoState> emit) async {
    emit(state.clone());
  }

  Future _enviarDados(SendEvent event, Emitter<AssinaturaAlunoState> emit) async {
    await service.assinarChamada(assinatura: event.assinatura);
 await   Future.delayed(const Duration(seconds: 3),(){
      Modular.to.pop();
    });
    Modular.to.pop();  Modular.to.pop();

  }
}
