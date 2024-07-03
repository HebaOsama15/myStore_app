import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class LoginTextFeild extends StatelessWidget {
  const LoginTextFeild({
    super.key,
    required this.controller,
    required this.lable,
    this.validator,
    this.onTap,
    this.readOnly,
    this.onChanged,
  });
  final TextEditingController controller;
  final String lable;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly?? false,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        // hintText: 'ُEnter $lable',
        label: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            lable,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black54),
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondColor.withOpacity(1),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
