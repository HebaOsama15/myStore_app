
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../model/product_info_model.dart/product.dart';
import '../../viewmodel/favorate_view_model.dart';

class ImageSilverAppbar extends StatelessWidget {
  const ImageSilverAppbar({
    super.key,
    required this.favorateProvider,
    required this.productPass,
  });

  final FavorateModelView favorateProvider;
  final Product productPass;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      floating: false,
      pinned: true,
      leading: IconButton(icon: Icon(Icons.arrow_back, color: primaryColor,size: 30,), onPressed: (){Navigator.pop(context);},),
      actions: [
        IconButton(onPressed: ()=> favorateProvider.toggleButtonColor(),
         icon: Icon(favorateProvider.icon, color: Colors.red, 
        size: 30,))
      ],
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight:
                Radius.circular(30)), 
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Image.network(
            productPass.image ?? "not found image",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
