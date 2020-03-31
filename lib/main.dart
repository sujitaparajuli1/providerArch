import 'package:archprovider/core/provider_setup.dart';
import 'package:archprovider/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'core/constants/app_contstants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
