
import 'package:flutter/material.dart';

class GoSignUp extends StatelessWidget {
  const GoSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/signup');
        },
        child: const Text.rich(
          TextSpan(
            text: "Don't have an account?  ",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Lato',
                color: Colors.black45),
            children: <TextSpan>[
              TextSpan(
                text: "Sing up",
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
    );
  }
}
