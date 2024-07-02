import 'package:e_commesce_app/core/component/widgets/count_quentity.dart';
import 'package:e_commesce_app/core/component/widgets/custom_container.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product.dart';
import 'package:e_commesce_app/core/feature/viewmodel/product_cart_model_view.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/cart_model_view.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ProductCartViewModel productCartProvider = Provider.of<ProductCartViewModel>(context);
    // productCartProvider.getProductByCart();
    CartViewModel cartProvider = Provider.of<CartViewModel>(context);
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomDownContainer(
                          width: 60,
                          height: 70,
                          isImage: false,
                          // image: cartProvider.carts[index],
                          
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${cartProvider.productsInCart[index].title}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: primaryColor),
                            ),
                            Text(
                              '50\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: primaryColor),
                            ),
                            CountQuentityWidget(
                              color: Colors.black54,
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {/*delete from cart here */},
                            icon: const Icon(
                              IconlyLight.delete,
                              color: secondColor,
                            ))
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
