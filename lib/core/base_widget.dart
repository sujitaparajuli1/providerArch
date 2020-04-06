import 'package:archprovider/viewmodels/base_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final T model;
  final Widget child;
  final Function(BuildContext context, T model, Widget child) builder;
  final Function(T model) onModelReady;

  const BaseWidget({this.model, this.builder, this.child, this.onModelReady});
  @override
  _BaseWidgetState<T> createState() {
    return _BaseWidgetState<T>();
  }
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.model,
      child: Consumer<T>(
        child: widget.child,
        builder: widget.builder,
      ), 
    );
  }
}
/*import 'package:archprovider/viewmodels/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget{
  final T model;
  final Widget child;
  final Function(BuildContext context,T model,Widget child) builder;
  final Function(T model) onModelReady;

  const BaseWidget({Key key, this.model, this.builder, this.child, this.onModelReady})  ;
  
  @override
  State<StatefulWidget> createState(){
  return _BaseWidgetState();
  }
}
class _BaseWidgetState<T extends BaseViewModel> extends State <BaseWidget<T>>{
  T model;
  @override
  void initState() {
    
    
    model = widget.model;
    if(model!= null){
      widget.onModelReady(model);
    }
  }
  
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
*/