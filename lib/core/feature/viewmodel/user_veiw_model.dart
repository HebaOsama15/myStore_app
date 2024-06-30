



import 'package:e_commesce_app/helper/shared_refrene_healper.dart';
import 'package:flutter/material.dart';

import '../../constants/api_routes.dart';
import '../../repositories/data_repo.dart';
import '../../repositories/online_data.dart';

import '../model/user_info_model.dart/user.dart';

class UserViewModel with ChangeNotifier{


  List<User> _users=[];
  List<User>get users => _users;
  
   UserViewModel(){
    getAllUsers();
   }

    
  //  Future<List<User>>
   loadData(DataRepo repo,String source)async{
    //print(source);
  //  try {
  //    Map<String,dynamic>data=await repo.getData(source: source);
  //  List<dynamic> d =data["data"];
  //  List<User>allUsers=d.map((e) => User.fromJson(e)).toList();

  //  return allUsers;

  //  } catch (e) {
  //    print(" loadData User error is $e");
  //    return [];
  //  }

  }
   
    Future<Map<String, dynamic>> loginUser(DataRepo repo, User user) async {
    Map<String, dynamic> feedback = await repo.postData(
      user.toJson(),
      API_URL.LOGIN,
    );

    print("feedback is : $feedback");
    print("token is ${feedback['token']}");
    await SharedPrefsHelper.setString("token", feedback['token']);
    
    return feedback;
  }

    Future<List<User>> getAllUsers ()async{
   _users =  await loadData(OnlineDataRepo(), API_URL.SIGNUP);
 
 notifyListeners();
  // print("users : ${_users}");
 return _users;

}
   Future<Map<String,dynamic>>addUser(DataRepo repo,User user)async{
    print("inside addTrip trip is $users");
   Map<String,dynamic>feedback=await repo.postData(user.toJson(),API_URL.SIGNUP);
   _users.add(user);
   print("feedback is :$feedback" );
   return feedback;

  }
//   static getshared()async{
  
//    SharedPrefsHelper.init();

//     phoneNumber = SharedPrefsHelper.getString("phone_number")?? "قم بادخال رقم هاتفك";
//     name = SharedPrefsHelper.getString("name")?? "قم بادخال اسمك";
//     id = SharedPrefsHelper.getInt("id");
//     role_type = SharedPrefsHelper.getString("roles");
//     token = SharedPrefsHelper.getString("token")?? "قم بإنشاء حساب";
// }
    



deleteUser(DataRepo repo, User user) async {
   await repo.deleteData({"id": user.id}, API_URL.SIGNUP);
   _users.remove(user);
   notifyListeners();
}


}