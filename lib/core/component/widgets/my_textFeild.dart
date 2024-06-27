import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';



// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType? textInputType;
  TextCapitalization? textCapitalization;
  String hintText;
  String? regex;
  bool lastItem;
  bool obscureText;
  Widget?suffix;
  Function(String)? onChange;
  Function()? onTap;
  String? Function(String?)? validator;
  MyTextField(
      {super.key, required this.controller,
      this.textInputType,
      this.textCapitalization,
      required this.hintText,
      this.regex,
      this.onChange,
      this.validator,
       this.lastItem = false,
       this.obscureText = false,
       this.suffix,
       this.onTap,
       });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: onChange,
          onTap: onTap??(){},
          obscureText:obscureText,
          controller: controller,
          cursorColor: primaryColor,
          
          keyboardType: textInputType ?? TextInputType.text,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
    ),
  ),
  suffixIcon: suffix,
  suffixIconColor: primaryColor,
  hintText: hintText,
  filled: true,
  fillColor: primaryColor.withOpacity(0.3),
  hintStyle: const TextStyle(color: Colors.black45, fontFamily: 'Cairo'),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
   borderSide: BorderSide.none,
  ),
),
          inputFormatters: regex != null
              ? [
                  FilteringTextInputFormatter.allow(RegExp('[$regex]+')),
                ]
              : null,
          validator: validator
        ),
        if(!lastItem)
        const SizedBox(
          height: 20,
        ),

      ],
    );
  }
}
