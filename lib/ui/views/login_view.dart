import 'package:archprovider/core/base_widget.dart';
import 'package:archprovider/core/constants/app_contstants.dart';
import 'package:archprovider/ui/widgets/login_header.dart';
import 'package:archprovider/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginView extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
  return BaseWidget<LoginViewModel>(
    model: LoginViewModel(
      authenticationService:Provider.of(context),
    ),
    child: LoginHeader(controller: controller,),
    builder: (BuildContext context,LoginViewModel model,Widget child)
    {
       return Scaffold(
            body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             child,
              model.busy?CircularProgressIndicator():
              FlatButton(
                child: Text("Login"),
                color: Colors.redAccent,
                onPressed: () async{
                  String value = controller.text;
                  int userId =int.tryParse(value);
                 bool sucess= await model.login(userId);
                 if(sucess){
                   //todo save the user sucess data in sharedpreference
                   Navigator.of(context).pushReplacementNamed(RoutePaths.Home);
                   
                 }
                },
                

                ),
            ],
          ),
          );
            

    },
    );
    

         
      
  }
}


/*
@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: LoginViewModel(authenticationService: Provider.of(context)),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(controller: _controller),
                model.busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                      )
              ],
            ),
          ),
      ),
    );
  }
  */