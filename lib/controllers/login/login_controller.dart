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

  @action
  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (loginType == 'company') {
      identification = prefs.getString('companyIdentification');
      password = prefs.getString('companyPassword');
    } 
    
    if (loginType == 'driver') {
      identification = prefs.getString('driverIdentification');
      password = prefs.getString('driverPassword');
    }

    print('LOGIN TYPE: $loginType');
    print('IDENTIFICATION: $identification');
    print('PASSWORD: $password');
    
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
      } 
      
      if (loginType == 'driver') {
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
}