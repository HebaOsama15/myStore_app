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
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    phone = json['phone'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['phone'] = this.phone;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}
