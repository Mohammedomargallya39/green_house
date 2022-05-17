import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/cubit/cubit.dart';
import '../../../core/util/cubit/state.dart';
import '../../../core/util/widgets/main_scaffold.dart';
import '../../cart/presentation/pages/cart_page.dart';
import '../../categories/presentation/pages/categories_page.dart';
import '../../home/presentation/pages/home_page.dart';
import '../../setting/presentation/pages/settings_page.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        scaffold: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: AppCubit.get(context).pageController,
            children:
            const [
              HomePage(),
              CategoriesPage(),
              CartPage(),
              SettingsPage(),
            ],
          ),
          bottomNavigationBar: BlocBuilder<AppCubit,AppState>(
            builder: (context, state) {
              return BottomNavigationBar(
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  onTap: (index) => AppCubit.get(context).bottomChanged(index, context),
                  unselectedLabelStyle: TextStyle(
                    color: HexColor(regularGrey),
                    height: 1.7,
                  ),
                  selectedLabelStyle: const TextStyle(
                    height: 1.7,
                  ),
                  currentIndex: AppCubit.get(context).currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.home_outlined,
                        ),
                      ),
                      label: appTranslation(context).home,
                    ),
                    BottomNavigationBarItem(
                      icon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.category_outlined,
                        ),
                      ),
                      label: appTranslation(context).categories,
                    ),
                    BottomNavigationBarItem(
                      icon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                        ),
                      ),
                      label: appTranslation(context).cart,
                    ),
                    BottomNavigationBarItem(
                      icon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.settings_outlined,
                        ),
                      ),
                      label: appTranslation(context).settings,
                    ),
                  ]
              );
            },
          ),
        ),
        // HideKeyboardPage(child: MainWidget()
        // ),
    );
  }
}
