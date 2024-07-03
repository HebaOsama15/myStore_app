import 'package:e_commesce_app/core/constants/api_routes.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/widgets/custom_container.dart';
import '../widgets.dart/catrgories_section.dart';
import '../widgets.dart/list_product_section.dart';
import '../widgets.dart/profile_appbar.dart';

// ignore: must_be_immutable
class ProductOfCategoryPage extends StatefulWidget {
  late String categoryName;
   ProductOfCategoryPage({super.key, required this.categoryName});

  @override
  State<ProductOfCategoryPage> createState() => _ProductOfCategoryPageState();
}

class _ProductOfCategoryPageState extends State<ProductOfCategoryPage> {
  // late List<Product> _products;
  
  @override
  void initState() {
    print("widget.categoryName is ${widget.categoryName}");
        Provider.of<ProdictViewModel>(context,listen: false).getProductsOfCategory('${API_URL.PRODUCT_CATEGORY}/${widget.categoryName}');
      // _loadProductsOfCategory();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
 
    ProdictViewModel productProvider = Provider.of<ProdictViewModel>(context);
    return Scaffold(
      appBar: customAppbar(context, title: "${widget.categoryName.toUpperCase()}", isProfile: false),
       body: Padding(
         padding:const EdgeInsets.only(left:15, right: 15,  bottom: 20),
         child: ListView(
           children: [
            const CategoreisSection(),
             ListProductSection(productList: productProvider.productsCategory),
             SizedBox(height: 50,)
           ],
         ),
       ),
    );
  }
}
