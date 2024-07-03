import 'package:e_commesce_app/helper/shared_refrene_healper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../constants/colors.dart';

AppBar customAppbar(BuildContext context, {String? title, bool isProfile = false}) {
    return AppBar(
        backgroundColor: primaryColor,
        leading: isProfile?Container()
        :IconButton(onPressed: ()=>Navigator.pushNamed(context, '/nav'),
         icon:const Icon(Icons.arrow_back, size: 30, color: Colors.white,)) ,
        centerTitle: true,
        title: Text(
          title ??"",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          isProfile?
          IconButton(onPressed: (){
      showDialog(
  context: context,
  barrierDismissible: false, // user must tap button!
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure to log out?',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: secondColor),),
      
      actions: <Widget>[
        TextButton(
          child: Text('Logout',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: secondColor),),
          onPressed: () {
       
            SharedPrefsHelper.removeString("token");
         
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        TextButton(
          child: Text('Cancel',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: secondColor),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },);
    }, icon: const Icon(IconlyLight.logout, color: Colors.white, size: 30,)): Container(),
          const SizedBox(width: 20,),
        ],
      );
  }