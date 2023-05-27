import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/widgets/drawer.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class MyPage extends StatelessWidget {
  final Widget? title;
  // final Widget? suffixWidget;
  // final Widget? prefixWidget;
  final bool? showDrawer;
  final bool? showAppBar;

  final List<Widget>? actions;
  Widget? floatingActionButton;
  final List<Widget> children;

  MyPage({
    Key? key,
    this.title,
    // this.suffixWidget,
    // this.prefixWidget,
    this.showDrawer = false,
    this.showAppBar = true,
    this.actions,
    this.floatingActionButton,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: showAppBar == true
          ? AppBar(
              title: title,
              actions: actions,
            )
          : null,
      drawer: showDrawer == true ? const DrawerMenu() : null,
      body: Padding(
        padding: const EdgeInsets.only(
          top: defaultPadding,
          bottom: defaultPadding,
        ),
        child: ListView.builder(
          itemCount: children.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => children[index],
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
