import 'dart:convert';

import 'package:archprovider/core/models/user.dart';
import 'package:http/http.dart'as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';
  
  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    try{
// Get user profile for id
    var response = await client.get('$endpoint/users/$userId');

    print("Response ${response.body}");
    final data=jsonDecode(response.body);
    if (data["id"]==null){
      return null;
    }
    //convert and return
    return User.fromJson(json.decode(response.body));
    }
    catch(e)
    {
print("Login exception $e");
return null;
    }
  }
 
}
