import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product.dart';

class ProductCart {
  int? productId;
  Product? product;
  int? quantity;

  ProductCart({this.productId, this.quantity, this.product});

  ProductCart.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
    product = json['product'] != null ?  Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['quantity'] = quantity;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}