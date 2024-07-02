import 'package:e_commesce_app/core/component/widgets/info_widget.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/functions/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets.dart/go_sign_up.dart';
import 'widgets.dart/login_button.dart';
import 'widgets.dart/login_feild.dart';

//TODO: باقي اضبط الفاليديشن ورسائل الخطأ بس

// ignore: must_be_immutable, use_key_in_widget_constructors
class LoginPage extends StatelessWidget {

  GlobalKey<FormState> logkey = GlobalKey<FormState>();
  List<TextEditingController> conList =
      List.generate(2, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginState>();
    return Scaffold(
      backgroundColor: primaryColor,
      body: InfoWidget(
        biulder: (context, deviceInfo) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: logkey,
              child: ListView(
                children: [
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  Image.asset("assets/images/my store logo.png"),
                  // const Spacer(),
                  LoginFeild(conList: conList),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30),
                    child: LoginButton(
                        loginState: loginState, logkey: logkey, conList: conList),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const GoSignUp(),
                  const SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: Divider(color: Colors.white, thickness: 1,)),
                        Padding(
                          padding: const EdgeInsets.only(left:10.0, right: 10),
                          child: Text("OR", 
                          style: Theme.of(context).textTheme.titleLarge,),
                        ),
                        const Expanded(child: Divider(color: Colors.white, thickness: 1,))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30 ,top: 20, bottom: 20),
                    child: LoginButton(
                      bgcolor: Colors.blue[400],
                      title: "Login By FaceBook",
                        loginState: loginState, logkey: logkey, conList: conList),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30, bottom: 20),
                    child: LoginButton(
                      bgcolor: Colors.red[900],
                      title: "Login By Google",
                        loginState: loginState, logkey: logkey, conList: conList),
                  ),
                  const Text("This sites is protected by reCAPTCHA and Google privacy policyand terms of services apply",
                  style: TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Colors.black45),textAlign: TextAlign.center,softWrap: true,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
