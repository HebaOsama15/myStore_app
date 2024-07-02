import 'package:e_commesce_app/core/constants/api_routes.dart';
import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product.dart';
import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  //  Future<void> _loadProductsOfCategory() async {
  //   _products = await Provider.of<ProdictViewModel>(context, listen: false)
  //       .getProductsOfCategory('${API_URL.PRODUCT_CATEGORY}/${widget.categoryName}');
  //       print("route is: ${API_URL.PRODUCT_CATEGORY}/${widget.categoryName}");
  //       print("products lienth is : ${_products.length} ");
  //   setState(() {});
  // }
  @override
  Widget build(BuildContext context) {
 
    ProdictViewModel productProvider = Provider.of<ProdictViewModel>(context);
    return Scaffold(
       body: ListView.builder(
        itemCount:
        // _products.length,
         productProvider.productsCategory.length,
        itemBuilder: (ctx, index){
          
        return ListTile(
          title: Text(productProvider.productsCategory[index].title??""),
        );
       }),
    );
  }
}