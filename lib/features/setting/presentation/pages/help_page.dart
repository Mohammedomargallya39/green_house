import 'package:flutter/cupertino.dart';
import 'package:green_house/core/util/widgets/back_scaffold.dart';

import '../widgets/help_widget.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
        body: HelpWidget(),
    );
  }
}
