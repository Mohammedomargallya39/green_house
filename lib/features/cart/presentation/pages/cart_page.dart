import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/keep_alive_widget.dart';
import '../../../../core/util/widgets/home_scaffold.dart';
import '../widgets/cart_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const HomeScaffold(
      widget: KeepAliveWidget(
        child: CartWidget(),
      ),
    );
  }
}
