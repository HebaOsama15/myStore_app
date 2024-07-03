import 'package:e_commesce_app/core/constants/api_routes.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/feature/viewmodel/cart_model_view.dart';
import 'package:e_commesce_app/core/functions/get_user_info.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../widgets.dart/cart_app_bar.dart';
import '../widgets.dart/cart_item.dart';

// ignore: use_key_in_widget_constructors
class CartPage extends StatelessWidget {
  
  // void initState() {
  //   Provider.of<CartViewModel>(context,listen: false).getProductsInCartByUser('${API_URL.CART_OF_USER}/${UserInfo.id}');
  //   print("cart url is : ${API_URL.CART_OF_USER}/${UserInfo.id}");
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    CartViewModel cartProvider = Provider.of<CartViewModel>(context);

    return Scaffold(
      appBar:cartProvider.carts.isNotEmpty? cartAppBar(context, cartProvider.carts[0].products!.length):cartAppBar(context, 0) ,
      body: Column(
        children: [
          const Expanded(flex: 1, child: CartItem()),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25, top: 10, bottom: 10),
                child: ListView(
                  children: [
                    TextField(
                        style: Theme.of(context).textTheme.titleMedium,
                        decoration: InputDecoration(
                          
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: secondColor),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: const Icon(
                            IconlyLight.discount,
                            color: Colors.white,
                          ),
                          hintText: 'Enter Promo Code ...',
                          hintStyle: Theme.of(context).textTheme.titleMedium,
                        )),
                        const SizedBox(height: 20,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index){
                            Map<String, double> bill = {
                                    "Sub Total": cartProvider.getSubTotal()??0.0,
                                    "Discount": 6.00,
                                    "Total": 390
                            };
                            return Padding(
                              padding: const EdgeInsets.only(top:10.0, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(bill.keys.toList()[index],
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                                  Text("${bill.values.toList()[index]} \$",
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                                ],
                              ),
                            );
                          }),
                        ),
                        ElevatedButton(onPressed: (){
                          Navigator.pushNamed(context, '/pay_page');
                        }, child: const Text("pay"))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
