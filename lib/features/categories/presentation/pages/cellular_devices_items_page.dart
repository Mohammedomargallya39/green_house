import 'package:flutter/cupertino.dart';
import 'package:green_house/core/util/constants.dart';

import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/cellular_devices_items_widget.dart';
import '../widgets/desktop_computers_items_widget.dart';
import '../widgets/display_devices_items_widget.dart';

class CellularDevicesItemsPage extends StatelessWidget {
  const CellularDevicesItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: CellularDevicesItemsScreen(),
        )
    );
  }
}
