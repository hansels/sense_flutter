import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sense_flutter/functions/loading_function.dart';
import 'package:sense_flutter/widgets/builder/future_use.dart';
import 'package:sense_flutter/configs/configs.dart';

abstract class BaseScreen extends StatefulWidget {
  final bool scrollable;
  final Color backgroundColor;
  final EdgeInsets padding;

  // void Function(VoidCallback fn) setState;

  BaseScreen({
    this.scrollable = true,
    this.backgroundColor,
    this.padding = Configs.screenEdgeInsets,
  });

  Future<bool> beforeScaffold(BuildContext context) {
    return Future.value(true);
  }

  Widget floatingActionButton(BuildContext context) {
    return null;
  }

  Widget bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget bottomSheet(BuildContext context) {
    return null;
  }

  Widget drawer(BuildContext context);
  Widget content(BuildContext context);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureUse(
      future: widget.beforeScaffold(context),
      widget: LoadingFunction.loadingSquareCircle(context),
      builder: (context, snapshot) {
        return KeyboardDismisser(
          child: Scaffold(
            backgroundColor: widget.backgroundColor ?? Colors.white,
            drawer: widget.drawer(context),
            bottomSheet: widget.bottomSheet(context),
            floatingActionButton: widget.floatingActionButton(context),
            bottomNavigationBar: widget.bottomNavigationBar(context),
            body: Padding(
              padding: widget.padding,
              child: _content(context),
            ),
          ),
        );
      },
    );
  }

  Widget _content(BuildContext context) {
    return widget.scrollable
        ? SingleChildScrollView(child: widget.content(context))
        : widget.content(context);
  }
}
