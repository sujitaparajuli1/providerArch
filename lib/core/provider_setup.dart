import 'package:archprovider/core/services/api.dart';
import 'package:archprovider/core/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget>providers=[
  ..._independantService,
  ..._dependantService
];
List<SingleChildWidget>_independantService =
[Provider.value(value: Api()),];
List<SingleChildWidget>_dependantService=[
  ProxyProvider(
    update: (BuildContext context,
    Api api,
    AuthenticationService authenticationService)
  {
    return AuthenticationService(api:api);
  },
  ),
  ];