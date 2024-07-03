import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product.dart';
import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product_cart.dart';
import 'package:e_commesce_app/core/feature/viewmodel/cart_model_view.dart';
import 'package:e_commesce_app/core/feature/viewmodel/favorate_view_model.dart';
import 'package:e_commesce_app/core/functions/get_user_info.dart';
import 'package:e_commesce_app/core/repositories/online_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../component/widgets/count_quentity.dart';
import '../../model/product_info_model.dart/cart.dart';
import '../widgets.dart/image_sliver_appbar.dart';

class DetialProduct extends StatefulWidget {
  const DetialProduct({super.key});

  @override
  State<DetialProduct> createState() => _DetialProductState();
}

class _DetialProductState extends State<DetialProduct> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<CartViewModel>(context,listen: false).getCartByUser();
  // }
  @override
  Widget build(BuildContext context) {
        final favorateProvider = Provider.of<FavorateModelView>(context);

    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Product productPass = args['argument'];
    print("product pass : ${productPass.title}");

    CartViewModel cartProvider = Provider.of<CartViewModel>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //لقي ستاك مع ت\رج الوان عشان يكون اللون ظخم
          ImageSilverAppbar(favorateProvider: favorateProvider, productPass: productPass),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 25,right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productPass.title??"not found text",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70),),
                  // Text(productPass.description??"not found text",
                  // style: Theme.of(context).textTheme.titleMedium,)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${productPass.price.toString()}\$",
                      style: Theme.of(context).textTheme.titleLarge,),
                  ],
                  //حطي حق الكمية هنا
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                //عه ذا عربيه بعدين الا حوشبي
                RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: favorateProvider.showFullText ? productPass.description : '${productPass.description!.split('\n')[0]}\n...',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextSpan(
            text: favorateProvider.showFullText ? '' : '   (Show more)',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = () {
              favorateProvider.toggleShowFullText();
            },
          ),
        ],
      ),
    ),
    const Divider(color: Colors.white,),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Qty:",
        style: Theme.of(context).textTheme.titleLarge,),
         const SizedBox(width: 15,),
         CountQuentityWidget(quentity:favorateProvider.counter ,)     
      ],
    ),
   
                ],
                
              ),
            ),
          ),
          
        ],
      ),
      bottomSheet:  Container(
        color: primaryColor,
        child: SizedBox(
          height: MediaQuery.of(context).size.height *0.09,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(onPressed: () async{
            
                try {
                  List<ProductCart>productCartQty = cartProvider.carts[0].products??[];
              List<ProductCart>list = [];
              list.addAll(productCartQty);
              print("=============================");
              print("product cart 1 = $list");
            ProductCart productCart = ProductCart(
                 productId: productPass.id,
                 quantity: favorateProvider.counter
            );
            print("q = ${favorateProvider.counter}");
              list.add(productCart);
              print("product cart 2 = $list");
              int id = cartProvider.carts[0].id!;
            Cart cart = Cart(
              id: id,
              userId: UserInfo.id,
              date: DateTime.now().toString(),
              products: list
            ) ;
         Map<String, dynamic>  result = await cartProvider.editCart(OnlineDataRepo(), cart, id);
            print("resut is : $result");
              Fluttertoast.showToast(
        msg: "Added to Cart done",
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
                  msg: "Field to Added Cart",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
                }
              // Navigator.pushNamed(context, 'cart');
            }, child: const Text("add to card")),
          )),
      ),
    );
  }
}

