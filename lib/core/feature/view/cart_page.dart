import 'package:e_commesce_app/core/component/widgets/custom_container.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'widgets.dart/cart_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppBar(context),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: scaffoldColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0, right: 20,top: 10, bottom: 10),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomDownContainer(width: 60, height: 100, isImage: false,)
                              ],
                            )
                          ]
                        ),
                      ),
                    ),
                  ))),
          Expanded(
              flex: 1,
              child: Container(
                color: primaryColor,
              ))
        ],
      ),
    );
  }
}
