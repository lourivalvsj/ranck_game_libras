import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/modules/login/models/login_model.dart';
import 'package:ranck_game_libras/app/widgets/input-text.dart';
import 'package:validatorless/validatorless.dart';

class FormLogin extends StatefulWidget {
  final void Function(LoginModel loginModel) onSubmit;

  const FormLogin(this.onSubmit, {super.key});

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final LoginModel _loginModel = LoginModel();

  _submit() {
    bool isValid = _formKey.currentState?.validate() ?? false;
    FocusScope.of(context).unfocus();

    if (isValid) {
      widget.onSubmit(_loginModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (_loginModel.isSignup == true)
                    InputText(
                      key: const ValueKey('name'),
                      name: 'Nome',
                      showLabel: true,
                      initialValue: _loginModel.name,
                      onChanged: (value) => _loginModel.name = value,
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.min(
                            4, 'A senha deve ter no mínimo 4 caracteres'),
                      ]),
                    ),
                  InputText(
                    key: const ValueKey('email'),
                    keyboardType: TextInputType.emailAddress,
                    name: 'E-Mail',
                    showLabel: true,
                    onChanged: (value) => _loginModel.email = value,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.email('Informe um email válido'),
                    ]),
                  ),
                  InputText(
                    obscureText: true,
                    key: const ValueKey('password'),
                    name: 'Senha',
                    showLabel: true,
                    onChanged: (value) => _loginModel.password = value,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.min(
                          7, 'A senha deve ter no mínimo 7 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                        _loginModel.isLogin == true ? 'Entrar' : 'Cadastrar'),
                  ),
                  TextButton(
                    child: Text(
                      _loginModel.isLogin == true
                          ? 'Criar uma nova conta?'
                          : 'Já possui uma conta?',
                    ),
                    onPressed: () {
                      setState(() {
                        _loginModel.toggleMode();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
