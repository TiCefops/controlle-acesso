
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/login_professor_model_impl.dart';
import 'event.dart';
import 'state.dart';

class LoginProfessorBloc extends Bloc<LoginProfessorBlocEvent, LoginProfessorBlocState> {
  LoginProfessorBloc() : super(LoginProfessorBlocState().init()) {
    on<InitEvent>(_init);
    on<LoginProfessorFetchDataLoading>((event,emit)async{
      print("Entrou");
      print(event);
     await Future.delayed(Duration(seconds: 4),(){
        print("Entrou3");
        LoginProfessorModelImpl modelImpl=LoginProfessorModelImpl(cpf: '000000', nome: 'Geremias');
        emit(LoginProfessorBlocSuccessState(professor: modelImpl));
      });



    });

  }



  void _init(InitEvent event, Emitter<LoginProfessorBlocState> emit) async {
    emit(state.clone());
  }


  Future<LoginProfessorBlocState> login()async{

return LoginProfessorBlocLoadingState();
  }
}
