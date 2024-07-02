
import 'package:dio/dio.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/feature/viewmodel/user_veiw_model.dart';
import 'package:e_commesce_app/core/functions/loading_state.dart';
import 'package:e_commesce_app/helper/shared_refrene_healper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../repositories/online_data.dart';
import '../../../model/user_info_model.dart/user.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
   LoginButton({
    super.key,
    required this.loginState,
    required this.logkey,
    required this.conList,
    this.bgcolor,
    this.title,
  });

  final LoginState loginState;
  final GlobalKey<FormState> logkey;
  final List<TextEditingController> conList;
  final UserViewModel userVM = UserViewModel();
  Color? bgcolor;
  String? title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: bgcolor ?? secondColor, // Text color
        elevation: 5, // Shadow elevation
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 10), // Button padding
      ),
      onPressed: () async {
        loginState.setLoading(true);
        try {
          if (logkey.currentState!.validate()) {
            loginState.setLoading(false);
    
            User p = User(
                //  email: conList[0].text,
                password: conList[1].text,
                username: conList[0].text);
            Map<String, dynamic> result =
                await userVM.loginUser(OnlineDataRepo(), p);
            print("user is ${p.name}");
            // print("result is ${result["data"]["name"]}");
            
           
           
              SharedPrefsHelper.setString(
                  "token", result["token"]);
    
              if (result["token"] != null) {
                Navigator.pushNamed(context, '/nav');
          
            }
          }
        } on DioException catch (e) {
          loginState.setErrorMessage(e.toString());
          loginState.setLoading(false);
    
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('خطأ'),
                content: Text(loginState.errorMessage!),
              );
            },
          );
        } catch (e) {
          print("the login error is: $e");
        }
      },
      child: 
      loginState.isLoading
          ? const SpinKitThreeBounce(
              color: Colors.white,
              size: 30.0,
            )
          :
            Text(title?? "Login"),
    );
  }
}
