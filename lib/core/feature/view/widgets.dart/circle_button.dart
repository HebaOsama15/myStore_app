
// ignore_for_file: must_be_immutable

import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
   CircleButton({
    super.key,
   required this.icon,
   required this.onTap,
  });
  IconData icon;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
      child: Container(
          width: 25.0,
          height: 25.0,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.all( Radius.circular(15.0)),
            border: Border.all(
              color: Colors.white70,
              width: 1.5,
            ),
          ),
          child: Center(
           child: Icon(icon, size: 20, color: Colors.white,),
          ),
        ),
    );
  }
}
