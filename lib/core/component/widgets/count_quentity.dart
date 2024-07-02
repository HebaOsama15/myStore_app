
// ignore_for_file: must_be_immutable

import 'package:e_commesce_app/core/feature/view/widgets.dart/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../feature/viewmodel/favorate_view_model.dart';

class CountQuentityWidget extends StatelessWidget {
   CountQuentityWidget({
    super.key,
    this.color,
  });
  
  Color? color;

  @override
  Widget build(BuildContext context) {
    final favorateProvider = Provider.of<FavorateModelView>(context);
    return Row(
     children: [
       CircleButton(icon: Icons.add, onTap: (){
     favorateProvider.incrementCounter();
    },),
    const SizedBox(width: 15,),
    Text("${favorateProvider.counter}",
    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: color??Colors.white),),
    const SizedBox(width: 15,),
    Center(child: CircleButton(icon: Icons.remove, onTap: (){
     favorateProvider.decrementCounter();
    },)), 
     ],
    );
  }
}