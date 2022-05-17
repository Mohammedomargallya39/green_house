import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/widgets/home_scaffold.dart';
import '../widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScaffold(
      widget: HomeWidget(),
    );
  }
}
