import 'package:flutter/cupertino.dart';
import 'package:green_house/core/util/constants.dart';

import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/desktop_computers_items_widget.dart';
import '../widgets/display_devices_items_widget.dart';

class DesktopComputersItemsPage extends StatelessWidget {
  const DesktopComputersItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: DesktopComputersItemsScreen(),
        )
    );
  }
}
