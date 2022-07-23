import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';



import 'core/app_module.dart';
import 'core/app_widget.dart';
import 'firebase_options.dart';

void main()async{

    // setUrlStrategy(PathUrlStrategy());
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);


  return runApp(ModularApp(module: AppModule(), child:const AppWidget()));
}
