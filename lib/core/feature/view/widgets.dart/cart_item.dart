import 'package:e_commesce_app/core/component/widgets/count_quentity.dart';
import 'package:e_commesce_app/core/component/widgets/custom_container.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/functions/get_user_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../repositories/online_data.dart';
import '../../model/product_info_model.dart/cart.dart';
import '../../model/product_info_model.dart/product_cart.dart';
import '../../viewmodel/cart_model_view.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  void initState() {
     Provider.of<CartViewModel>(context,listen: false).getCartByUser();
     Provider.of<CartViewModel>(context,listen: false).getProductsInCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    // ProductCartViewModel productCartProvider = Provider.of<ProductCartViewModel>(context);
    // productCartProvider.getProductByCart();
    CartViewModel cartProvider = Provider.of<CartViewModel>(context);
    print("cartProvider.productsInCart is ${cartProvider.carts}");
    print("cartProvider.productsInCart is ${cartProvider.productsInCart}");
    return Container(
        decoration: const BoxDecoration(
            color: scaffoldColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black54,
            ),
            itemCount: cartProvider.productsInCart.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
              Navigator.pushNamed(
                  context,
                  '/detial_product',
                  arguments: {'argument': cartProvider.productsInCart[index]},
                );
            },
                child: 
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading:CustomDownContainer(
                            width: 60,
                            height: 100,
                            isImage: true,
                            image: cartProvider.productsInCart[index].image,
                            
                          ), 
                title:Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  '${cartProvider.productsInCart[index].title}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: primaryColor),
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                ),
                              ), 
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                                '${cartProvider.productsInCart[index].price}\$',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: primaryColor),
                              ),
                              CountQuentityWidget(
                                color: Colors.black54,
                                // quentity: cartProvider.carts[0].products![index].quantity,
                              )
                  ],
                ),
                trailing: IconButton(
                              onPressed: () async{
                               try {
                                  List<ProductCart>productCartQty = cartProvider.carts[0].products??[];
              List<ProductCart>list = [];
              list.addAll(productCartQty);
              print("=============================");
              print("product cart 1 = $list");
            ProductCart productCart = ProductCart(
                 productId: cartProvider.productsInCart[index].id,
                 quantity: 0
                //  favorateProvider.counter
            );
            // print("q = ${favorateProvider.counter}");
              list.remove(productCart);
              print("product cart 2 = $list");
            Cart cart = Cart(
             userId: UserInfo.id,
             date: DateTime.now().toString(),
              products: list
            ) ;
         Map<String, dynamic>  result = await cartProvider.editCart(OnlineDataRepo(), cart, cartProvider.carts[0].id!,);
            print("resut is : $result");
            Fluttertoast.showToast(
        msg: "Removed form Cart done",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white,
        textColor: primaryColor,
        fontSize: 16.0
    );
                               } catch (e) {
                                 print("error is $e");
                  Fluttertoast.showToast(
                  msg: "Field to removed from Cart",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
                               }
              
                              },
                              icon: const Icon(
                                IconlyLight.delete,
                                color: secondColor,
                              ))
                )

                
              ),
            ),
          ),
        ));
  }
}
