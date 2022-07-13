import 'package:equatable/equatable.dart';

import '../data/model/login_professor_model_impl.dart';

abstract class LoginProfessorBlocEvent extends Equatable {
  const LoginProfessorBlocEvent();
  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends LoginProfessorBlocEvent {}

class LoginProfessorFetchData extends LoginProfessorBlocEvent {}

class LoginProfessorFetchDataError extends LoginProfessorBlocEvent {
  final String message;

  const LoginProfessorFetchDataError(this.message);
}

class LoginProfessorFetchDataLoading extends LoginProfessorBlocEvent {


}

