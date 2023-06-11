import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/login/models/login_model.dart';
import 'package:ranck_game_libras/app/modules/login/widgets/form_login.dart';
import 'package:ranck_game_libras/utils/routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;

  Future<void> _handleSubmit(LoginModel loginModel) async {
    setState(() {
      _isLoading = true;
    });

    UserCredential userCredential;

    try {
      if (loginModel.isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: loginModel.email!.trim(),
          password: loginModel.password!,
        );
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: loginModel.email!.trim(),
          password: loginModel.password!,
        );

        final userData = {
          'name': loginModel.name,
          'email': loginModel.email,
          'active': false,
          'isAdmin': false,
        };

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set(userData);
      }

      Get.toNamed(AppRoutes.NIVEL_DIFICULDADE);
    } catch (err) {
      // var msg = err.code ?? 'Ocorreu um erro! Verifique suas credenciais!';
      // if (err.code == "too-many-requests") msg = "Senha inválida...";
      // if (err.code == "user-not-found") msg = "Usuário não encontrado...";
      // if (err.code == "unknown") msg = "Verifique sua conexão!";
      // if (err.code == "too-many-requests")
      //   msg =
      //       "Bloqueamos todas as solicitações deste dispositivo devido a atividade incomum. Tente mais tarde.";
      // if (err.code == "user-disabled")
      //   msg = "Usuário desabilitado, procure o administrador!";
      // print(err.code);
      // print(err.message);
      // _scaffoldKey.currentState.showSnackBar(
      //   SnackBar(
      //     content: Text(msg),
      //     backgroundColor: Theme.of(context).errorColor,
      //   ),
      // );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.orange[300],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/images/logo.png',
                // fit: BoxFit.cover,
              ),
            ),
            Stack(
              children: [
                FormLogin(_handleSubmit),
                if (_isLoading)
                  Positioned.fill(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
