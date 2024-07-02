  import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/functions/get_user_info.dart';
import 'package:e_commesce_app/helper/shared_refrene_healper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

AppBar homePageAppBar(BuildContext context) {
  // userInfo.getUserInfoByToken;
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      backgroundColor: primaryColor,
      
      leading: Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/images/images-removebg-preview.png',fit: BoxFit.contain,),
      
                    )
                    
                  ),
                  titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcom ${UserInfo.name??"User"}",
          style: Theme.of(context).textTheme.titleLarge,),
          Text("Have a nice day?",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white60),),
        ],
      ),
      actions: [
        
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
      }, icon: const Icon(IconlyLight.logout, color: Colors.white, size: 30,)),
      const SizedBox(width: 20,),
      ],
    );
  }