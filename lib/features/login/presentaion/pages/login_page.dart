import 'package:flutter/material.dart';
import '../../../../core/util/widgets/hide_keyboard_page.dart';
import '../../../../core/util/widgets/home_scaffold.dart';
import '../../../../core/util/widgets/main_scaffold.dart';
import '../widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      widget: HideKeyboardPage(child: LoginWidget(),),
    );
  }
}
