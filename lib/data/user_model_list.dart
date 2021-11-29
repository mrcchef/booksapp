import 'package:book_app/user_model.dart';

class UserModelList {
  late List<UserModel> userModelList;

  UserModelList({required this.userModelList});

  UserModelList.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json['clients'] != null) {
      userModelList = [];
      json['clients'].forEach((v) {
        userModelList.add(UserModel.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (userModelList != null) {
      data['clients'] = userModelList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
