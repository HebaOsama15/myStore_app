
import 'package:e_commesce_app/core/component/widgets/ligon_text_feild.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/feature/viewmodel/user_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user_info_model.dart/user.dart';
import '../widgets.dart/profile_appbar.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> listt = [
    "user name",
    "email",

  ];

  // @override
  // void initState() {
  //       Provider.of<UserViewModel>(context,listen: false).getUserById('${API_URL.SIGNUP}/${UserInfo.id}');
  //   super.initState();
  // }

  List<TextEditingController> cons =
      List.generate(2, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
 
    UserViewModel userProvider = Provider.of<UserViewModel>(context);
   cons[0].text = userProvider.userApp.name?.firstname ?? "";
    cons[1].text = userProvider.userApp.email?? "";
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(context, title: "My Profile", isProfile: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Column(
            children: [
             const  Expanded(
                  flex: 1,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/images-removebg-preview.png'),
                          // backgroundImage
                          //  child:f !=null?Image.file(f!):                
                          //  Image.network("assets/images/user_profile.jpg", fit: BoxFit.fill,),
                        ),
                        // InkWell(
                        //       onTap: ()async{
                        //       // f =await userProvider.chooseImage();
                        //       },
                        //       child:const CircleAvatar(
                        //         backgroundColor: secondColor,
                        //         radius: 15,
                        //         child: Icon(IconlyLight.camera,color: Colors.white,size: 20,),
                        //       ),
                        //     ),
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
    "delete an account",
    style: TextStyle(
      fontFamily: 'Lato',
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
