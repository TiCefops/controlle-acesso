import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';


import 'core/app_module.dart';
import 'core/app_widget.dart';

void main(){
  setUrlStrategy(PathUrlStrategy());
  return runApp(ModularApp(module: AppModule(), child:const AppWidget()));
}
