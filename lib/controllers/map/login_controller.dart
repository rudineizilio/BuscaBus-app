import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  SharedPreferences prefs;  
  
  @observable
  String identification;

  @observable
  String password;

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @observable
  bool memorizeLoginData = false;

  @observable
  String loginType;

  @observable
  String prefsIdentification;

  @observable
  String prefsPassword;

  @action
  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (loginType == 'company') {
      prefsIdentification = prefs.getString('companyIdentification');
      prefsPassword = prefs.getString('companyPassword');
    } else {
      prefsIdentification = prefs.getString('driverIdentification');
      prefsPassword = prefs.getString('driverPassword');      
    }

    identification = prefsIdentification;
    password = prefsPassword;
    
    return;
  }

  @action
  void setIdentification(String value) => identification = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  Future<void> login() async {
    loading = true;

    if (memorizeLoginData) {
      if (loginType == 'company') {
        prefs.setString('companyIdentification', identification);
        prefs.setString('companyPassword', password);
      } else {
        prefs.setString('driverIdentification', identification);
        prefs.setString('driverPassword', password);        
      }
    }

    await Future.delayed(Duration(seconds: 3));

    loading = false;
    loggedIn = true;
  }

  @action
  void logout() {
    loggedIn = false;

    loginType = '';
    identification = '';
    password = '';

    print('Saiuuuuuuuuuuuuuu');
  }

  @action
  void setMemorizeLoginData(bool value) {
    memorizeLoginData = value;
  }

  @action
  void setLoginType(String value) {
    loginType = value;
  }

  @computed
  bool get isIdentificationIsValid => identification != null && identification.length > 1;

  @computed
  bool get isPasswordIsValid => password != null && password.length > 1;

  @computed
  bool get isFormValid => isIdentificationIsValid && isPasswordIsValid;

  @computed
  Function get loginPressed =>
    (isIdentificationIsValid && isPasswordIsValid && !loading) ? login : (null);

  @computed
  Function get logoutPressed =>
    !loggedIn ? logout : (null);
}