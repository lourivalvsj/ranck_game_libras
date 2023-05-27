import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/widgets/my-snackbar.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void showSnackbar({
    required MySnackBar mySnackBar,
  }) {
    ScaffoldMessenger.of(scaffoldKey.currentState!.context).showSnackBar(
      mySnackBar,
    );
  }
}
