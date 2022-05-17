// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:training_app/core/util/cubit/cubit.dart';
// import 'package:training_app/features/home/presentation/pages/home_page.dart';
// import '../../../core/util/constants.dart';
// import '../../cart/presentation/pages/cart_page.dart';
// import '../../categories/presentation/pages/categories_page.dart';
// import '../../setting/presentation/pages/settings_page.dart';
//
// class MainWidget extends StatelessWidget {
//   const MainWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: AppCubit.get(context).pageController,
//         children:
//         const [
//           HomePage(),
//           CategoriesPage(),
//           CartPage(),
//           SettingsPage(),
//         ],
//       ),
//       bottomNavigationBar: BlocBuilder(
//         builder: (context, state) {
//           return BottomNavigationBar(
//               showSelectedLabels: true,
//               showUnselectedLabels: true,
//               onTap: (index) => AppCubit.get(context).bottomChanged(index, context),
//               unselectedLabelStyle: TextStyle(
//                 color: HexColor(regularGrey),
//                 height: 1.7,
//               ),
//               selectedLabelStyle: const TextStyle(
//                 height: 1.7,
//               ),
//               currentIndex: AppCubit.get(context).currentIndex,
//               items: [
//                 BottomNavigationBarItem(
//                     icon: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                           Icons.home_outlined,
//                         color: AppCubit.get(context).currentIndex == 0
//                             ? HexColor(mainColor)
//                             : HexColor(darkGreyColor),
//                       ),
//                     ),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.category_outlined,
//                       color: AppCubit.get(context).currentIndex == 0
//                           ? HexColor(mainColor)
//                           : HexColor(darkGreyColor),
//                     ),
//                   ),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.shopping_cart_outlined,
//                       color: AppCubit.get(context).currentIndex == 0
//                           ? HexColor(mainColor)
//                           : HexColor(darkGreyColor),
//                     ),
//                   ),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.settings_outlined,
//                       color: AppCubit.get(context).currentIndex == 0
//                           ? HexColor(mainColor)
//                           : HexColor(darkGreyColor),
//                     ),
//                   ),
//                 ),
//
//               ]
//           );
//         },
//       ),
//     );
//   }
// }
