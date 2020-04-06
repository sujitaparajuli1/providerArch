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
    bool response =  await authenticationService.login(userId);
    setBusy(false);
    return response;
    //notify the login screen to stop showing progress
  }
}