// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LoginTextFormField extends StatelessWidget {
//   LoginTextFormField({
//     Key? key,
//     this.controller,
//     this.suffixIcon,
//     required this.isPassword,
//     required this.validationMessage,
//
//   }) : super(key: key);
//
//   TextEditingController? controller;
//   IconButton? suffixIcon;
//   bool isPassword = false;
//   String? validationMessage;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//         controller: controller,
//         maxLines: 1,
//         keyboardType: TextInputType.emailAddress,
//         obscureText: isPassword,
//         validator: (value)
//         {
//           if(value!.isEmpty)
//           {
//             return validationMessage;
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//           suffixIcon: suffixIcon,
//
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0 ),
//             borderSide: const BorderSide(color: Colors.grey , width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0 ),
//             borderSide: const BorderSide(color: Colors.grey , width: 2),
//           ),
//         )
//     );
//   }
// }
