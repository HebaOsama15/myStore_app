// ignore_for_file: must_be_immutable

import 'package:e_commesce_app/core/component/widgets/ligon_text_feild.dart';
import 'package:e_commesce_app/core/constants/api_routes.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/functions/get_user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/product_view_model.dart';
import '../widgets.dart/home_page_appbar.dart';
import '../widgets.dart/product_show_sction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  int _selectedIndex = -1;
  @override
  void initState() {
    super.initState();
    UserInfo.getUserInfoByToken();
    
  }

  @override
  Widget build(BuildContext context) {
    // var MediaQueryData = MediaQuery.of(context);
    var size = MediaQuery.of(context).size;
        ProdictViewModel productProvider = Provider.of<ProdictViewModel>(context);


   
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Text(
              "Find Your Style",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontSize: 35),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            //TODO: تفاهمي مع ذا بعدين
            LoginTextFeild(
                controller: searchController, lable: "Search here ..."),
            SizedBox(
              height: screenHeight * 0.02,
            ),
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
            Text(
              "For You",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            ProductShowSection(
                screenHeight: screenHeight,
                itemWidth: itemWidth,
                itemHeight: itemHeight,
                screenWeidth: screenWeidth)
          ],
        ),
      ),
    );
  }
}
