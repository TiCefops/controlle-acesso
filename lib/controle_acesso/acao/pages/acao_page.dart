import 'package:cefops_controll_acess/core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import 'package:cefops_controll_acess/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../listar_turmas/data/interface/model/i_listar_turmas_entity.dart';

class AcaoPage extends StatelessWidget {
  const AcaoPage({Key? key, required this.turma}) : super(key: key);
  final IListarTurmasEntity turma;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: size.height * 0.04),
          Expanded(
            flex: 1,
            child: Text(
              "Ação para turma: ${turma.nome}",
              style: TextStyle(
                  fontSize: size.width * 0.03, fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(100, 50)),
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.blue)),
                  onPressed: () => Modular.to
                      .pushNamed('./listar_alunos?acao=1', arguments: turma),
                  child: const Text(
                    "Entrada",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(100, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.blue)),
                  onPressed: () => Modular.to
                      .pushNamed('./listar_alunos?acao=2', arguments: turma),
                  child: const Text(
                    "Saída",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
