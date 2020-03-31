import 'dart:async';

import 'package:archprovider/core/models/user.dart';


import 'api.dart';

class AuthenticationService {
  final Api api;

  AuthenticationService({this.api});

  StreamController<User> _userController = StreamController<User>.broadcast();

  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    var fetchedUser = await api.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.sink.add(fetchedUser);
    }

    return hasUser;
  }
  dispose(){
    _userController.close();
  }
}
