import 'package:flutter/material.dart';

class StreamUse<T> extends StatefulWidget {
  StreamUse({@required this.stream, @required this.builder, this.widget});

  final Stream<T> stream;
  final Widget widget;
  final Widget Function(BuildContext, AsyncSnapshot<T>) builder;

  @override
  _StreamUseState<T> createState() => _StreamUseState<T>();
}

class _StreamUseState<T> extends State<StreamUse<T>> {
  Stream<T> stream;
  @override
  void initState() {
    this.stream = widget.stream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        return widget.builder(context, snapshot);
      },
    );
  }
}
