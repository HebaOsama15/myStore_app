import 'package:e_commesce_app/core/component/widgets/info_widget.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/functions/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset("assets/images/my store logo.png"),
                  const Spacer(),
                  LoginFeild(conList: conList),
                  LoginButton(
                      loginState: loginState, logkey: logkey, conList: conList),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: ' ما عندك حساب  ',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Lato',
                              color: Colors.black45),
                          children: <TextSpan>[
                            TextSpan(
                              text: " انشئ حساب جديد ",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black45,
                                  fontSize: 16,
                                  // decorationStyle: TextDecorationStyle.double,
                                  fontFamily: 'Lato'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
