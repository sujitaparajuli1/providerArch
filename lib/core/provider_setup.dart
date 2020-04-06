import 'package:archprovider/core/services/api.dart';
import 'package:archprovider/core/services/authentication_service.dart';
import 'package:archprovider/core/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget>providers=[
  ..._independantService,
  ..._dependantService
];
List<SingleChildWidget>_independantService =
[Provider.value(value: Api()),
Provider.value(value: DbService())
];
List<SingleChildWidget>_dependantService=[
  ProxyProvider2(
    update: (BuildContext context,
    Api api,DbService dbService,
    AuthenticationService authenticationService)
  {
    return AuthenticationService(api:api,dbService: dbService);
  },
  ),
  ];