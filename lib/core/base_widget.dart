import 'package:archprovider/viewmodels/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget{
  final T model;
  final Widget child;
  final Function(BuildContext context,T model,Widget child) builder;

  const BaseWidget({Key key, this.model, this.builder, this.child})  ;
  @override
  State<StatefulWidget> createState(){
  return _BaseWidgetState();
  }
}
class _BaseWidgetState<T extends BaseViewModel> extends State <BaseWidget<T>>{
  
  @override
  Widget build(BuildContext context){
  return ChangeNotifierProvider<T>.value(
    value: widget.model,
    child: Consumer<T>(
      child: widget.child,
      builder: widget.builder,
      )

    ,);
}
}
