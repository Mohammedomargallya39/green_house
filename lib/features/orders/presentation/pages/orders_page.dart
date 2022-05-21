import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/core/util/widgets/back_scaffold.dart';
import '../../../../core/util/keep_alive_widget.dart';
import '../../../../core/util/widgets/home_scaffold.dart';
import '../../../../core/util/widgets/system_back_button.dart';
import '../widgets/orders_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      body: const KeepAliveWidget(
        child: SystemBackButton(
            child: OrderWidget()
        ),
      ),
    );
  }
}
