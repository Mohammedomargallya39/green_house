import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/cubit/cubit.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:green_house/core/util/widgets/back_scaffold.dart';
import '../../../../core/util/keep_alive_widget.dart';
import '../../../../core/util/widgets/home_scaffold.dart';
import '../../../../core/util/widgets/system_back_button.dart';
import '../widgets/orders_details_widget.dart';
import '../widgets/orders_widget.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage(
      {Key? key,
      required this.orderID,
      }) : super(key: key);
  final String? orderID;
  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      body: KeepAliveWidget(
        child: SystemBackButton(
            child: BlocBuilder<AppCubit,AppState>(
              builder: (context, state) => OrderDetailsWidget(
                orderID: orderID,
              ),
            )
        ),
      ),
    );
  }
}
