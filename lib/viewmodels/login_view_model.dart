import 'package:archprovider/core/services/authentication_service.dart';
import 'package:archprovider/viewmodels/base_view_model.dart';

class LoginViewModel extends BaseViewModel
{
  final AuthenticationService authenticationService;
  LoginViewModel({ this.authenticationService });

  Future<bool> login(int userId) async
  {
    setBusy(true); 
    //notify the login screen to show progress
    var response =  await authenticationService.login(userId);
    setBusy(false);
    //notify the login screen to stop showing progress
  }
}