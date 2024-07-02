import 'package:e_commesce_app/core/feature/viewmodel/favorate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoratePage extends StatelessWidget {
  const FavoratePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavorateModelView favorateProvider = Provider.of<FavorateModelView>(context);
    return  Scaffold(
      body: ListView.builder(
        itemCount:favorateProvider.allFavprateProducts.length ,
        itemBuilder: (context, index){
        return Text("${favorateProvider.allFavprateProducts[index].title}");
        }),
    );
  }
}