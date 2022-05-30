// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:green_house/core/util/cubit/cubit.dart';
// import 'package:green_house/core/util/cubit/state.dart';
// import 'package:green_house/core/util/widgets/my_button.dart';
// import 'package:green_house/core/util/widgets/my_form.dart';
// import 'package:green_house/features/setting/presentation/widgets/choose_between_two_options.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../../../../core/util/constants.dart';
//
// class AddProductWidget extends StatelessWidget {
//   AddProductWidget({Key? key}) : super(key: key);
//   final productTitleController = TextEditingController();
//   final productDescriptionController = TextEditingController();
//   final productQuantityController = TextEditingController();
//   final productPriceController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppCubit,AppState>(
//       builder: (context, state) {
//         return SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: responsiveValue(
//                 context,
//                 12.0,
//               ),
//               vertical: responsiveValue(
//                 context,
//                 18.0,
//               ),
//             ),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                    Stack(
//                      alignment: Alignment.bottomRight,
//                      children: [
//                        // Container(
//                        //   width: responsiveValue(context, 200.0),
//                        //   height: responsiveValue(context, 200.0),
//                        //   decoration: BoxDecoration(
//                        //     borderRadius: BorderRadius.circular(
//                        //       responsiveValue(context, 55),
//                        //     ),
//                        //   ),
//                        //   child:
//                        // ),
//                       AppCubit.get(context).galleryProductImage != null ?
//                       Container(
//                         width: double.infinity,
//                         height: responsiveValue(context, 200.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                             responsiveValue(context, 55),
//                           ),
//                         ),
//                         child: Image.file(
//                           AppCubit.get(context).galleryProductImage!,
//                           fit: BoxFit.fill,
//                         ),
//                       ) :
//                       Container(
//                         width: double.infinity,
//                         height: responsiveValue(context, 200.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                             responsiveValue(context, 55),
//                           ),
//                         ),
//                         child: Image.asset(
//                           'assets/images/sell.png',
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                        IconButton(
//                          onPressed: ()
//                          {
//                            AppCubit.get(context).selectGalleryImage();
//                          },
//                          icon: Icon(
//                            Icons.camera_alt_outlined,
//                            color: HexColor(mainColor),
//                          ),
//                        ),
//                      ],
//                    ),
//                    space16Vertical(context),
//                    MyForm(
//                        label: 'Product Title',
//                        controller: productTitleController,
//                        type: TextInputType.text,
//                        error: 'Please enter a valid title',
//                        isPassword: false
//                    ),
//                    space16Vertical(context),
//                    MyForm(
//                        label: 'Product Description',
//                        controller: productDescriptionController,
//                        type: TextInputType.text,
//                        error: 'Please enter a valid description',
//                        isPassword: false
//                    ),
//                    space16Vertical(context),
//                    Row(
//                     children: [
//                       Expanded(
//                         child: MyForm(
//                              label: 'Product Quantity',
//                              controller: productQuantityController,
//                              type: TextInputType.phone,
//                              error: 'Please enter a valid quantity',
//                              isPassword: false
//                          ),
//                       ),
//                       space10Horizontal(context),
//                       Expanded(
//                         child: MyForm(
//                              label: 'Product Price',
//                              controller: productPriceController,
//                              type: TextInputType.phone,
//                              error: 'Please enter a valid price',
//                              isPassword: false
//                          ),
//                       ),
//                     ],
//                   ),
//                    space30Vertical(context),
//                    MyButton(
//                        onPressed: ()
//                        {
//
//                        },
//                        text: 'Add Product'
//                    ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
