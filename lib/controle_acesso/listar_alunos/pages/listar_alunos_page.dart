import 'package:cefops_controll_acess/controle_acesso/listar_alunos/bloc/listar_alunos_state.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import 'package:cefops_controll_acess/core/erros/widgets/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import '../../../core/themes/app_colors.dart';
import '../bloc/listar_alunos_bloc.dart';
import '../bloc/listar_alunos_event.dart';

class ListarAlunosPage extends StatelessWidget {
  final IListarTurmasEntity turma;
  final String acao;

  const ListarAlunosPage({Key? key, required this.turma, required this.acao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListarAlunosBloc bloc = Modular.get<ListarAlunosBloc>();
    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: true,botao: FloatingActionButton(onPressed: () {
        Modular.to.navigate("/adm/");
    },),
      child: BlocProvider(
        create: (BuildContext context) =>
            bloc..add(CarregandoEvent(idTurma: turma.id)),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }



  Widget _buildPage(BuildContext context) {
    final ListarAlunosBloc bloc = Modular.get<ListarAlunosBloc>();
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ListarAlunosBloc, ListarAlunosState>(
      bloc: BlocProvider.of<ListarAlunosBloc>(context),
      builder: (context, state) {
        if (state is ErrorState) {
          return ErrorTextWidget(
            message: "${state.message} ${turma.nome}",
          );
        }
        if (state is CarregadoState) {
          return SafeArea(
            child: SizedBox(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "${state.alunos.length} Alunos da Turma: ${turma.nome}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.04),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.80,
                    child: ListView.separated(
                      itemCount: state.alunos.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                              bloc.add(EnviandoEvent(state.alunos[index],turma.id,acao));
                          },
                          child: Container(
                            padding:const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.blue, width: 3)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nome: ${state.alunos[index].nome}",
                                  style:
                                  TextStyle(fontSize: size.width * 0.04),
                                ),
                                Text(
                                  state.alunos[index].status
                                      ? "Status: Ativo"
                                      : "Status: inativo",
                                  style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: state.alunos[index].status
                                          ? Colors.teal
                                          : Colors.red),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
