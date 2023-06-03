import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ranck_game_libras/app/theme/my_theme.dart';
import 'package:ranck_game_libras/utils/global_scaffold.dart';

import 'firebase_options.dart';
import 'utils/routes/app_pages.dart';
import 'utils/routes/app_routes.dart';

void main() async {
  Intl.defaultLocale = 'pt_BR';
  // initializeDateFormatting('pt_BR');
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ranck Game Libras',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.NIVEL_DIFICULDADE,
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scaffoldKey,
          body: child,
        );
      },
    );
  }
}
