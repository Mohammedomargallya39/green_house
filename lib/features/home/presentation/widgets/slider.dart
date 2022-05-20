import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/core/util/cubit/cubit.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/util/constants.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget({Key? key}) : super(key: key);

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                items: AppCubit.get(context).images.map((e) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: responsiveValue(context, 10.0,),
                      horizontal: responsiveValue(context, 8.0,),
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ).toList(),
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    AppCubit.get(context).changeSlide();
                    AppCubit.get(context).currentSliderIndicator = index;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: AppCubit.get(context).images.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: AppCubit.get(context).currentSliderIndicator == entry.key ? 12.0 : 6.0,
                        height: AppCubit.get(context).currentSliderIndicator == entry.key ? 12.0 : 6.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 2.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : HexColor(mainColor))
                              .withOpacity(
                            AppCubit.get(context).currentSliderIndicator == entry.key ? 1.0 : 0.3,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}