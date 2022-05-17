import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'main_scaffold.dart';

class HomeScaffold extends StatelessWidget {
  final Widget widget;

  const HomeScaffold({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: MainScaffold(
            scaffold: Scaffold(
              // appBar: AppBar(
              //   leading: IconButton(
              //     onPressed: ()
              //     {
              //     },
              //     icon: Icon(
              //       Icons.menu,
              //       color: HexColor(mainColor),
              //     ),
              //   ),
              //   actions: [
              //     IconButton(
              //         onPressed: ()
              //         {
              //
              //         },
              //         icon: const Icon(Icons.search),
              //         color: HexColor(mainColor),
              //     ),
              //   ],
              //   centerTitle: false,
              //   titleSpacing: 20.0,
              // ),
              body: widget,
               // drawer: const Drawer(),
            ),
          ),
        );
      },
    );
  }
}
