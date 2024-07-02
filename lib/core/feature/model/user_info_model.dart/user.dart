import 'package:e_commesce_app/core/feature/model/user_info_model.dart/address.dart';

import 'name_user.dart';

class User {
  int? id;
  String? username;
  String? email;
  String? password;
  Name? name;
  String? phone;
  Address? address;
  int? iV;

  User(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.name,
      this.phone,
      this.address,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    phone = json['phone'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['phone'] = phone;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['__v'] = iV;
    return data;
  }
}
