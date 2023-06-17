import 'package:get_storage/get_storage.dart';
import 'package:ranck_game_libras/app/modules/user/models/user_model.dart';

class AppStorage {
  //Singleton
  AppStorage._internal();
  static final AppStorage instance = AppStorage._internal();
  factory AppStorage() {
    return instance;
  }

  final storage = GetStorage();
  // Token
  String? get token => storage.read('token');
  User? get user => storage.read('user');

  void setToken(String? token) =>
      (token == null) ? storage.remove('token') : storage.write('token', token);

  void setUser(User? user) =>
      (user == null) ? storage.remove('user') : storage.write('user', user);
}
