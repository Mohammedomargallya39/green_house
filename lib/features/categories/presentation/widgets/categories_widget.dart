import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';
import '../../../../core/util/widgets/custom_delegate.dart';
import '../../../product_details/presentaion/pages/product_details_page.dart';
import '../pages/cellural_devices_page.dart';
import '../pages/desktop_computers_page.dart';
import '../pages/display_devices_page.dart';
import '../pages/video_gaming_page.dart';
import 'category items.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveValue(
              context,
              6.0,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CategoryItems(
                  function: ()
                  {
                    navigateTo(context,  const DisplayDevicesCategoryPage());
                  },
                  productName: 'MSI Nvidia GTX 1660 Ti',
                  productImage: 'assets/images/shopping.png',
                  categoryTitle: appTranslation(context).displayDevices,
                ),
                CategoryItems(
                  function: ()
                  {
                    navigateTo(context, const DeskTopComputersCategoryPage());
                  },
                  productName: 'Laptop Asus',
                  productImage: 'assets/images/sell.png',
                  categoryTitle: appTranslation(context).desktopComputers,
                ),
                CategoryItems(
                  function: ()
                  {
                    navigateTo(context, const VedioGamingCategoryPage());
                  },
                  productName: 'Pes 2022',
                  productImage: 'assets/images/market.png',
                  categoryTitle: appTranslation(context).videoGaming,
                ),
                CategoryItems(
                  function: ()
                  {
                    navigateTo(context, const CellularDevicesCategoryPage());
                  },
                  productName: 'MSI Nvidia GTX 1660 Ti',
                  productImage: 'assets/images/shopping.png',
                  categoryTitle: appTranslation(context).cellularDevices,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
