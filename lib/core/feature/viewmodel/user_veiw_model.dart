



import 'package:e_commesce_app/core/functions/get_user_info.dart';
import 'package:e_commesce_app/helper/shared_refrene_healper.dart';
import 'package:flutter/material.dart';
import '../../constants/api_routes.dart';
import '../../repositories/data_repo.dart';
import '../../repositories/online_data.dart';

import '../model/user_info_model.dart/user.dart';

class UserViewModel with ChangeNotifier{


  List<User> _users=[];
  List<User>get users => _users;

  User userApp = User();
  
   UserViewModel(){
    getAllUsers();
    getUserById();
   }

    
  //  Future<List<User>>
  Future<List<User>> loadData(DataRepo repo,String source)async{
    try {
    List<dynamic> d = await repo.getListData(source: source) ;
    print("d is $d");
    List<User> allUsers = d.map((e) => User.fromJson(e)).toList();

    return allUsers;
  } catch (e) {
    print(" loadData users error is $e");
    return [];
  }

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
  Future<User> loadSingleUser(DataRepo repo, String source) async {
    //print(source);
    try {
      Map<String, dynamic> data = await repo.getMapData(source: source);
      // List<dynamic> d = data["data"];
      // print("the data is ${d}");
      User user = User.fromJson(data);
      print("Tracks is ${user.name}");
      return user;
    } catch (e) {
      print(" loadData error Track is $e");
    throw Exception('Failed to load user: $e');
    }
  }

 Future <User> getUserById() async {
  try {
   userApp = await loadSingleUser(OnlineDataRepo(), '${API_URL.SIGNUP}/${UserInfo.id}');
    print("user in singleUserList is : $userApp");
    notifyListeners();
    return userApp;

  } catch (e) {
    print("Error fetching user: $e");
    rethrow;
  }
 }



  //  Future<void> _loadSingleUser(BuildContext context) async {
  //   singleUserList = await Provider.of<UserViewModel>(context, listen: false)
  //       .getUserById('${API_URL.SIGNUP}/${UserInfo.id}');
  //       print("route is: ${API_URL.PRODUCT_CATEGORY}/${UserInfo.id}");
    
  // }



deleteUser(DataRepo repo, User user) async {
   await repo.deleteData({"id": user.id}, API_URL.SIGNUP);
   _users.remove(user);
   notifyListeners();
}


}