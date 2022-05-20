import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class BackScaffold extends StatelessWidget {
  final Widget body;
  final Color color;
  Color? iconColor;
  double elevation;

  BackScaffold({
    Key? key,
    required this.body,
    this.color = Colors.white,
    this.iconColor,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Directionality(
          textDirection: AppCubit.get(context).isRtl
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: elevation,
            ),

            body: body,
          ),
        );
      },
    );
  }
}
