// ignore_for_file: must_be_immutable

import 'package:e_commesce_app/core/component/widgets/ligon_text_feild.dart';
import 'package:e_commesce_app/core/functions/get_user_info.dart';
import 'package:flutter/material.dart';

import '../widgets.dart/catrgories_section.dart';
import '../widgets.dart/home_page_appbar.dart';
import '../widgets.dart/product_show_sction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
 
  @override
  void initState() {
    super.initState();
    UserInfo.getUserInfoByToken();
    
  }

  @override
  Widget build(BuildContext context) {
    // var MediaQueryData = MediaQuery.of(context);
    var size = MediaQuery.of(context).size;
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
            LoginTextFeild(
              readOnly: true,
              onTap: () {
                Navigator.pushNamed(context, '/search_page');
              },
                controller: searchController, lable: "Search any product here ..."),
            SizedBox(
              height: screenHeight * 0.02,
            ),
           const CategoreisSection(),
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
