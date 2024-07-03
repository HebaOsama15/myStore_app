import 'dart:convert';


import 'package:dio/dio.dart';

import '../../helper/dion_connection.dart';
import 'data_repo.dart';

class OnlineDataRepo extends DataRepo{
  @override
  // Future<Map<String,dynamic>>
  Future<List<dynamic>>
  getListData({required String source, List<String>? columns}) async{
    try{
      Response<String> serverResponse=await DioConnection.connect().get(source);
      //Response<String> serverResponse=await Dio().get(source);

      // Map<String,dynamic> 
      List<dynamic> content=jsonDecode(serverResponse.data!);
     // print(content);
      return content;
    }catch(ex){

      return [];
    }

  }

  @override
  Future<Map<String, dynamic>> postData(Map<String, dynamic> dataToSend,String source) async{
    Response<String>serverResponse=await DioConnection.connect().post(source,data: dataToSend);
try {
    if(serverResponse.statusCode==200){
      Map<String,dynamic> info=jsonDecode(serverResponse.data!);
      // return info;
      if (info.containsKey("data")) {
      Map<String, dynamic>? result = info["data"];

      if (result != null && result.containsKey("id")) {
        if (result["id"] == -1) {
          print("ID is -1"); 
        } else {
          print("ID is ${result["id"]}");  
        }
      } else {
        print("Missing 'data' in 'result'");  
      }
    } else {
      print("Missing 'result' in response");  
    }

    return info;
    }
    else {
      return {"id":-1};
    }
} on DioException catch (e) {
  if (e.response != null) {
    print(e.response!.data);
    print(e.response!.headers);
    print(e.response!.requestOptions);
  } else {
    print(e.requestOptions);
    print(e.message);
  }
  return {};
}

  }
  
 

  @override
  Future<Map<String, dynamic>> deleteData(Map<String, dynamic> dataToSend, String source)async {
     String deleteUrl = '$source/${dataToSend["id"]}';

    Response<String> serverResponse = await DioConnection.connect().delete(deleteUrl);

    try {
  if (serverResponse.statusCode == 200) {
    Map<String, dynamic> info = jsonDecode(serverResponse.data!);
    if (info.containsKey("data")) {
      Map<String, dynamic>? result = info["data"];

      if (result != null && result.containsKey("id")) {
        // Handle the successful response
        print("ID is ${result["id"]}");
        print("Name is ${result["name"]}");
        print("Phone number is ${result["phone_number"]}");
        // ... Handle other properties as needed
      } else {
        // Handle the case where "data" or "id" is missing
        print("Missing 'data' or 'id' in the response");
      }
    } else {
      // Handle the case where "data" is missing
      print("Missing 'data' in the response");
    }
  } else {
    // Handle the error case
    print("Error: ${serverResponse.statusCode}");
  }
  return {};
} on DioException catch (e) {
  // Handle the exception case
  print("DioException occurred: ${e.message}");
  return {};
}
  }

  @override
  Future<Map<String, dynamic>> putData(Map<String, dynamic> dataToSend, String source)async {
     Response<String> serverResponse = await DioConnection.connect().put(source, data: dataToSend);
     print("put data in Online repo is : $dataToSend");
     try {
  if (serverResponse.statusCode == 200) {
    Map<String, dynamic> info = jsonDecode(serverResponse.data!);
    print("info is : $info");
    return info;
    // if (info.containsKey("data")) {
    //    print("info2  is : $info");
    // //   Map<String, dynamic>? result = info;
    // //  print("info result is : $result");
    // //   if (result != null && result.containsKey("id")) {
    // //     // Handle the successful response
    // //     print("ID is ${result["id"]}");
    // //     print("Name is ${result["name"]}");
    // //     print("Phone number is ${result["phone_number"]}");
    // //     // ... Handle other properties as needed
    // //   } else {
    // //     // Handle the case where "data" or "id" is missing
    // //     print("Missing 'data' or 'id' in the response");
    // //   }
    // } else {
    //   // Handle the case where "data" is missing
    //   print("Missing 'data' in the response");
    //   print("Error: ${serverResponse.statusCode}");
    // }
  } else {
    // Handle the error case
    print("Error: ${serverResponse.statusCode}");
  }
  return {};
} on DioException catch (e) {
  // Handle the exception case
  print("DioException occurred: ${e.message}");
  return {};
}
}

  @override
  Future<Map<String, dynamic>> getMapData({required String source, List<String>? columns})async {
    try{
      Response<String> serverResponse=await DioConnection.connect().get(source);
      Map<String,dynamic> content=jsonDecode(serverResponse.data!);
      return content;
    }catch(ex){

      return {};
    }
  }

}
