import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ranck_game_libras/app/modules/login/pages/login_page.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/bindings/nivel_dificuldade_binding.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/pages/nivel_dificuldade_page.dart';
import 'package:ranck_game_libras/app/theme/my_theme.dart';
import 'package:ranck_game_libras/utils/global_scaffold.dart';

import 'firebase_options.dart';
import 'utils/routes/app_pages.dart';
//import 'package:ranck_game_libras/app/modules/data/gerar_dados.dart';

void main() async {
  Intl.defaultLocale = 'pt_BR';
  // initializeDateFormatting('pt_BR');
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inserir dados definidos
  //await GerarDados.insertAll();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rank Game Libras',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      getPages: AppPages.routes,
      // initialRoute: AppPages.INITIAL,
      initialBinding: NivelDificuldadeBinding(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return const NivelDificuldadePage();
          } else {
            return const LoginPage();
          }
        },
      ),
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scaffoldKey,
          body: child,
        );
      },
    );
  }
}
