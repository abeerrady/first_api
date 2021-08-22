import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignUpController {
  Future<String> signup(String email , String password) async{

    try {
      final formData = ({
        'email': email,
        'password': password ,
        'returnSecureToken': true,
      });
      final respone = await Dio().post('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCV5njiqk7d51MFJJF3Ri2_c1NcenPm_wk',
      data:  formData,
        options: Options(
          contentType: 'application/json',
          method: 'Post',
          validateStatus: (state)=> state <500,
        )
      );
      final data = respone.data as Map;
      if(data.containsKey('idToken')) {
        String idToken = data['idToken'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('idToken', idToken);
        return 'ok';
      } else return'error , please try again';
    } catch(e) {
      throw e;
    }

  }
}