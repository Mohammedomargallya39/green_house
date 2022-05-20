import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/widgets/home_scaffold.dart';
import '../../../../core/util/widgets/system_back_button.dart';
import '../widgets/categories_widget.dart';



class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScaffold(
      widget: SystemBackButton(
          child: CategoriesWidget()
      ),
    );
  }
}
