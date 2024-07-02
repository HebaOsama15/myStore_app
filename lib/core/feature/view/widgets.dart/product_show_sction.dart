import 'package:e_commesce_app/core/component/widgets/custom_container.dart';
import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../model/product_info_model.dart/product.dart';

// ignore: must_be_immutable
class ProductShowSection extends StatelessWidget {
  ProductShowSection({
    super.key,
    required this.screenHeight,
    required this.itemWidth,
    required this.itemHeight,
    required this.screenWeidth,
  });

  final double screenHeight;
  final double itemWidth;
  final double itemHeight;
  final double screenWeidth;
  bool isDown = true;

  @override
  Widget build(BuildContext context) {
    ProdictViewModel productProvider = Provider.of<ProdictViewModel>(context);
    return SizedBox(
      height: screenHeight,
      child: GridView.builder(
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: isDown
              ? (itemWidth / itemHeight * 1.2)
              : (itemWidth / itemHeight * 1),
          // controller: ScrollController(keepScrollOffset: false),
          // shrinkWrap: true,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: productProvider.products.length,
        itemBuilder: (BuildContext context, int index) {
          List result = [];
          for (int i = 0; i < productProvider.products.length - 1; i++) {
            result.add((i % 2 == 0) ? isDown = true : isDown = false);
          }
          return ContanerShape(
            isDown: false,
            productProvider: productProvider,
            screenHeight: screenHeight,
            screenWeidth: screenWeidth,
            product: productProvider.products[index],
          );
        },
      ),
    );
  }
}

class ContanerShape extends StatelessWidget {
  const ContanerShape({
    super.key,
    required this.productProvider,
    required this.screenHeight,
    required this.screenWeidth,
    required this.product,
    required this.isDown,
  });

  final ProdictViewModel productProvider;
  final double screenHeight;
  final double screenWeidth;
  final Product product;
  final bool isDown;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detial_product',
          arguments: {'argument': product},
        );
      },
      child: SizedBox(
        height: screenHeight * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: CustomDownContainer(
                width: screenWeidth,
                height: screenHeight * 5,
                image: product.image,
                borderRadius:const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconlyLight.heart,
                          color: primaryColor,
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                product.title ?? "",
                style: Theme.of(context).textTheme.titleSmall,
                softWrap: true,
              ),
            ),
            Expanded(
                flex: 2,
                child: Text("${product.price} \$",
                    style: Theme.of(context).textTheme.titleSmall))
          ],
        ),
      ),
    );
  }
}
