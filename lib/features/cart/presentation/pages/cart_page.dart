import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/keep_alive_widget.dart';
import '../../../../core/util/widgets/home_scaffold.dart';
import '../../../../core/util/widgets/system_back_button.dart';
import '../widgets/cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScaffold(
      widget: KeepAliveWidget(
        child: SystemBackButton(
            child: CartWidget()
        ),
      ),
    );
  }
}

