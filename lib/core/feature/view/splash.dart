
import 'package:e_commesce_app/core/feature/view/navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../helper/shared_refrene_healper.dart';
import '../../constants/colors.dart';
import 'login.dart/login_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     Duration(seconds: 3), ()=> _checkAuth(context));
  
  // }
  @override
  Widget build(BuildContext context) {
    _checkAuth(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:const BoxDecoration(
          color: primaryColor,
          //TODO: عقب سدحي صفحة السبلاش هنا بعد ما تصممينها
          // image: DecorationImage(
          //   image: AssetImage('assets/images/splash.png'), 
          //   fit: BoxFit.cover,
          // ),
        ),
      
      ),
    );
  }
}


_checkAuth(BuildContext context)async{
  await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      if(SharedPrefsHelper.getString('token')==null) {
        return LoginPage();
      } else {
        return MasterPage();
      }
    }));
}

// homePage(){
//   String? role = SharedPrefsHelper.getString("roles");
// if (role == "Admin") {
//   return AdminHomePage();
// } else if (role == "NormalUser") return const NAvi();
//   // NormalUserHomePage();
//   else return const PageNotFound();
// }