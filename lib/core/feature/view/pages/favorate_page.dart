import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/feature/view/widgets.dart/list_product_section.dart';
import 'package:e_commesce_app/core/feature/viewmodel/favorate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets.dart/catrgories_section.dart';

class FavoratePage extends StatelessWidget {
  const FavoratePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavorateModelView favorateProvider = Provider.of<FavorateModelView>(context);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: Container(),
        centerTitle: true,
        title: Text('Favorate',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 30),),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListProductSection(productList: favorateProvider.allFavprateProducts,),
      ),
    );
  }
}