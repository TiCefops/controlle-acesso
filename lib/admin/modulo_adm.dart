import 'package:cefops_controll_acess/admin/listar_assinaturas/bloc/listar_assinaturas_bloc.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/provider/listar_assinaturas_provider_impl.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/repository/listar_assinaturas_repository_impl.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/pages/listar_assinaturas_page.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/service/listar_assinaturas_service_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModuloAdm extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
            (i) => ListarAssinaturasProviderImpl(FirebaseFirestore.instance)),
        Bind.factory(
            (i) => ListarAssinaturasRepositoryImpl(i())),
        Bind.factory(
            (i) => ListarAssinaturasServiceImpl(i())),
        Bind.factory(
            (i) => ListarAssinaturasBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => ListarAssinaturasPage()),
  ];
}
