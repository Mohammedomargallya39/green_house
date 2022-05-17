import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class MainScaffold extends StatelessWidget {
  final Widget scaffold;

  const MainScaffold({
    Key? key,
    required this.scaffold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Directionality(
          textDirection: AppCubit.get(context).isRtl
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: scaffold,
        );
      },
    );
  }
}
