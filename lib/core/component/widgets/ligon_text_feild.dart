import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class LoginTextFeild extends StatelessWidget {
  const LoginTextFeild({
    super.key,
    required this.controller,
    required this.lable,
    this.validator
  });
  final TextEditingController controller;
  final String lable;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: 'ادخل $lable',
        label: Text(
          lable,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
