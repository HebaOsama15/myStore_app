import 'package:jwt_decoder/jwt_decoder.dart';

import '../../helper/shared_refrene_healper.dart';

class UserInfo {
  
  static String? name;
  static int? id;
  static int? iat;

 static getUserInfoByToken(){
    String yourToken = SharedPrefsHelper.getString('token')!;
   Map<String, dynamic> decodedToken = 
   JwtDecoder.decode(yourToken);
   name = decodedToken['user'];
   id = decodedToken['sub'];
   iat = decodedToken['iat'];
   print("JwtDecoder.decode(yourToken) is$decodedToken");

   }
}