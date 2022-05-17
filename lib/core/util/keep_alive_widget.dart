import 'package:flutter/material.dart';

class KeepAliveWidget extends StatefulWidget {
  const KeepAliveWidget({
    required this.child,
  });

  final Widget child;

  @override
  _KeepAliveWidgetState createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin<KeepAliveWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
