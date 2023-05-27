import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/initial/controllers/initial_controller.dart';

class DrawerMenu extends GetView<InitialController> {
  final String _nomeUsuario = "Nome do Usuário";
  final String _email = "email@email.com";
  final String _avatar = "/assets/images/avatar.png";
  final bool _temPermissao = true; //Definir a permissão do usuário
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // elevation: 50,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // UserAccountsDrawerHeader(
          //   accountName: Text(AppStorage.instance.user?.username ?? ''),
          //   accountEmail: Text(AppStorage
          //           .instance.user?.person.emails?.first.name
          //           .toLowerCase() ??
          //       ''),
          //   currentAccountPicture: const CircleAvatar(
          //     backgroundImage: AssetImage(
          //       "assets/images/avatar.jpg",
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Get.isDarkMode
          //         ? SobratColors.primaryDark
          //         : SobratColors.primaryLight,
          //   ),
          // ),
          // ListTile(
          //   title: const Text("Proposta"),
          //   onTap: () => Get.toNamed(AppRoutes.PROPOSTA_LIST_PAGE),
          // ),
          // ExpansionTile(
          //   title: Text("Cadastros"),
          //   children: <Widget>[
          //     ListTile(
          //       title: const Text("Cidades"),
          //       onTap: () => Get.toNamed(AppRoutes.CIDADE_LIST_PAGE),
          //     ),
          //     ListTile(
          //       title: const Text("Ufs"),
          //       onTap: () => Get.toNamed(AppRoutes.UF_LIST_PAGE),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
