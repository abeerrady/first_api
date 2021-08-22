import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginController {
  Future<String> login(String email , String password) async{
    final response = await Dio().post('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCV5njiqk7d51MFJJF3Ri2_c1NcenPm_wk',
    data: jsonEncode(
      {'email': email, 'password': password , 'returnSecureToken': true}
    ),
      options: Options(validateStatus: (status){
        return status <500;
      })
    );
    final data = response.data as Map;
    if(data.containsKey('idToken'))
      {
        String idToken = data['idToken'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('idToken', idToken);
        return'ok';
      }

  }
}