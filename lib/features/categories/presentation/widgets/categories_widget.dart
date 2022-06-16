import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/features/categories/presentation/widgets/desktop_computers_items.dart';
import 'package:green_house/features/categories/presentation/widgets/video_gaming_items.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';
import '../pages/cellular_devices_items_page.dart';
import '../pages/desktop_computers_items_page.dart';
import '../pages/display_devices_items_page.dart';
import '../pages/video_gaming_items_page.dart';
import 'cellural_devices_items.dart';
import 'display_devices_items.dart';

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
            child: ConditionalBuilder(
              condition: AppCubit.get(context).itemModel != null,
              builder: (context)=> Column(
                children: [
                  DisplayDevicesItems(
                    categoryTitle: appTranslation(context).displayDevices,
                    function: ()
                    {
                      navigateTo(context, const DisplayDevicesItemsPage());
                    },
                  ),
                  DesktopComputersItems(
                    categoryTitle: appTranslation(context).desktopComputers,
                    function: ()
                    {
                      navigateTo(context, const DesktopComputersItemsPage());
                    },
                  ),
                  VideoGamingItems(
                    categoryTitle: appTranslation(context).videoGaming,
                    function: ()
                    {
                      navigateTo(context, const  VideoGamingItemsPage());
                    },
                  ),
                  CellularDevicesItems(
                    categoryTitle: appTranslation(context).cellularDevices,
                    function: ()
                    {
                      navigateTo(context, const  CellularDevicesItemsPage());
                    },
                  ),

                ],
              ),
              fallback: (context) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: responsiveValue(
                    context,
                    350.0,
                  ),
                ),
                child: Center(
                    child: CircularProgressIndicator(
                      color: HexColor(greenColor),
                    )

                ),
              ),            ),
          ),
        );
      },
    );
  }
}
