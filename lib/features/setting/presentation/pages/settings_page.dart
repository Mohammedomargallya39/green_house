import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/widgets/home_scaffold.dart';
import '../widgets/settings_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScaffold(
      widget: SettingsWidget(),
    );
  }
}
