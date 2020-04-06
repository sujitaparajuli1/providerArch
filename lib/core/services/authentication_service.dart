import 'dart:async';

import 'package:archprovider/core/models/user.dart';

import 'api.dart';
import 'db_service.dart';
 
class AuthenticationService {
  final Api api;
  final DbService dbService;
  AuthenticationService({this.api,this.dbService});

  StreamController<User> _userController = StreamController<User>.broadcast();

  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    var fetchedUser = await api.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    
    if (hasUser) {
      dbService.insertUser(fetchedUser);
      //insert the user object into our local db
      _userController.sink.add(fetchedUser);
    }
    return hasUser;
  }

  dispose(){
    _userController.close();
  }
}