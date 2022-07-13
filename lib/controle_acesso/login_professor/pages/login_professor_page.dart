import 'package:cefops_controll_acess/controle_acesso/login_professor/blocks/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/bloc.dart';
import '../blocks/event.dart';

class LoginProfessorPage extends StatelessWidget {
  const LoginProfessorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginProfessorBloc>(
          create: (BuildContext context) =>
              LoginProfessorBloc()..add(LoginProfessorFetchDataLoading()),
          child: Builder(builder: (context) => _buildPage(context))),
    );
  }
}

Widget _buildPage(BuildContext context) {
  return BlocBuilder<LoginProfessorBloc, LoginProfessorBlocState>(
    bloc: BlocProvider.of<LoginProfessorBloc>(context),
    builder: (context, state) {
      print(            state.runtimeType );
      return SizedBox(
        child: Column(
          children: [
            TextFormField(),
            state is LoginProfessorFetchDataLoading
                ? Center(child: const CircularProgressIndicator())
                : Center(
                    child: TextButton(
                      onPressed: () async {
                        print(state is LoginProfessorFetchDataLoading);
                        context
                            .read<LoginProfessorBloc>()
                            .add(LoginProfessorFetchDataLoading());
                        print(context
                            .read<LoginProfessorBloc>()
                            .state
                            .runtimeType);
                        print(state is LoginProfessorFetchDataLoading);
                      },
                      child: const Text("Entrar"),
                    ),
                  )
          ],
        ),
      );
    },
  );
}
