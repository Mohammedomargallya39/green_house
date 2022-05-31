import 'package:flutter/cupertino.dart';
import 'package:green_house/core/util/constants.dart';

import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/display_devices_items_widget.dart';

class DisplayDevicesItemsPage extends StatelessWidget {
  const DisplayDevicesItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: DisplayDevicesItemsScreen(
            product: appTranslation(context).displayDevices,
          ),
        )
    );
  }
}
