import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../viewmodel/product_view_model.dart';

class CategoreisSection extends StatefulWidget {
  const CategoreisSection({super.key});

  @override
  State<CategoreisSection> createState() => _CategoreisSectionState();
}

class _CategoreisSectionState extends State<CategoreisSection> {
   int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    ProdictViewModel productProvider = Provider.of<ProdictViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              "Categoreis",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: screenHeight * 0.09,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productProvider.categories.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                          // Navigator.pushNamed(
                          //   context,
                          //   '/products_of_category',
                          //   arguments: {'argument': productProvider.categories[index]},
                          // );
                          Navigator.pushNamed(
                            context,
                           '/products_of_category',
                           arguments: productProvider.categories[index] );
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 15, right: 10),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          color: _selectedIndex == index
                              ? secondColor
                              : scaffoldColor.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          ),
                        ),
                        child: Center(
                          child: 
                          Text(productProvider.categories[index],
                          style: Theme.of(context).textTheme.titleSmall,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
      ],
    );
  }
}