import 'package:e_commesce_app/core/component/widgets/ligon_text_feild.dart';
import 'package:e_commesce_app/core/feature/view/widgets.dart/list_product_section.dart';
import 'package:e_commesce_app/core/feature/view/widgets.dart/profile_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/product_view_model.dart';

class SearchPage extends StatelessWidget {
   SearchPage({super.key});

final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProdictViewModel productProvider = Provider.of<ProdictViewModel>(context);
    return Scaffold(
      appBar: customAppbar(context, title: "SEARCH"),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            LoginTextFeild(

                controller: searchController,
                lable: "Search any product here ...",
                onChanged: (p0) {
                  productProvider.filterTProducts(p0);
                },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            ListProductSection(productList: productProvider.resultSearchProduct),
          ],
        ),
      ),
    );
  }
}