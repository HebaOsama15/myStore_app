
import 'package:e_commesce_app/core/component/widgets/ligon_text_feild.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/functions/get_user_info.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../helper/shared_refrene_healper.dart';
import '../../model/user_info_model.dart/user.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  List<String> listt = [
    "user name",
    "iat",
  ];

  List<TextEditingController> cons =
      List.generate(2, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
 
    // UserVM userProvider = Provider.of<UserVM>(context);
    cons[0].text = UserInfo.name ?? "";
    cons[1].text = UserInfo.iat.toString();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: Container(),
          centerTitle: true,
          title: Text(
            "My Profile",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            
            IconButton(onPressed: (){
        showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you sure to log out?',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: secondColor),),
        
        actions: <Widget>[
          TextButton(
            child: Text('Logout',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: secondColor),),
            onPressed: () {
         
              SharedPrefsHelper.removeString("token");
           
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          TextButton(
            child: Text('Cancel',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: secondColor),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },);
      }, icon: const Icon(IconlyLight.logout, color: Colors.white, size: 30,)),
            const SizedBox(width: 20,),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Column(
            children: [
               Expanded(
                  flex: 1,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                      const  CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/images-removebg-preview.png'),
                          // backgroundImage
                          //  child:f !=null?Image.file(f!):                
                          //  Image.network("assets/images/user_profile.jpg", fit: BoxFit.fill,),
                        ),
                        InkWell(
                              onTap: ()async{
                              // f =await userProvider.chooseImage();
                              },
                              child:const CircleAvatar(
                                backgroundColor: secondColor,
                                radius: 15,
                                child: Icon(IconlyLight.camera,color: Colors.white,size: 20,),
                              ),
                            ),
                      ],
                    ),
                  )),
              const Spacer(),
              Expanded(
                  flex: 4,
                  child: Column(
                      children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom:30.0),
                      child: LoginTextFeild(
                          controller: cons[index], lable: listt[index]),
                    ),
                  ))),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: secondColor, 
        elevation: 5, 
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), 
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 10), // Button padding
      ),
                onPressed: ()async {
                // User user = User(name: cons[0].text, phoneNumber: cons[1].text,);
                // print(f.toString());

              // try {
                  
              //  Map<String, dynamic> date =await userProvider.updateuserProfile(user, API_URL.UPDATEUSER + '/' +SharedPrefsHelper.getInt("id").toString(), f);
               
              //  if (date['code'] == 200) {
              //    print("تم التعديل بنجاح");
              //  }
              //   else {
              //    print("في حاجة غلط");
              //  }
              // } catch (e) {
              //   print("الخطأ هو $e");
              //   // print("data is : $data");
              // }
              }, child: const Text("Save")),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: scaffoldColor, // Text color
        elevation: 5, // Shadow elevation
        shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 2,
          color: scaffoldColor
        ),
          borderRadius:
              BorderRadius.circular(20), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 10), // Button padding
      ),
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("هل أنت متأكد من حذف الحساب؟",
          style: Theme.of(context).textTheme.titleLarge,),
          content: Text("إذا حذفت الحساب فستفقد كل بياناتك ولن تتمكن من استرجاعها مجددا",
          style: Theme.of(context).textTheme.titleMedium,),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("إلغاء",
              style: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      // color: Colors.red,
    ),),
            ),
            TextButton(
              onPressed: () async {
                User u = User(
                  // id: SharedPrefsHelper.getInt("id"),
                  // name: SharedPrefsHelper.getString("name"),
                );
                try {
                  // await userProvider.deleteUser(OnlineDataRepo(), u);
                  // Navigator.pushNamed(context, "/login");
                } catch (e) {
                  print('Error deleting user: $e');
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child:const Text("حذف",
              style: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.white,
    ),),
            ),
          ],
        );
      },
    );
  },
  child: const Text(
    "حذف الحساب",
    style: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 16,
      color: Colors.red,
    ),
  ),
)
            ],
          ),
        ),
      ),
    );
  }
}
