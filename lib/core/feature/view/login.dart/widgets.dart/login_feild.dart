
import 'package:flutter/material.dart';

import '../../../../component/widgets/ligon_text_feild.dart';

class LoginFeild extends StatelessWidget {
  const LoginFeild({
    super.key,
    required this.conList,
  });

  final List<TextEditingController> conList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const SizedBox(
                    height: 20,
                  ),
              itemCount: conList.length,
              itemBuilder: (context, index) {
                List<Map<String, dynamic>> li = [
                  {
                    "اسم المستخدم": const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 20,
                    )
                  },
                  {
                    " كلمة المرور": const Icon(
                      Icons.password,
                      color: Colors.grey,
                      size: 20,
                    )
                  }
                ];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginTextFeild(
                    controller: conList[index],
                    lable: li[index].keys.first,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
