class LoginResponseModel {
  String? refresh;
  String? access;

  LoginResponseModel({this.refresh, this.access});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}

class User {
  String? fullName;
  String? email;
  bool? isVerified;
  List<String>? roles;
  bool? hasFilledProfileInfo;
  bool? hasFilledEducationInfo;
  bool? hasFilledWorkExperience;

  User(
      {this.fullName,
        this.email,
        this.isVerified,
        this.roles,
        this.hasFilledProfileInfo,
        this.hasFilledEducationInfo,
        this.hasFilledWorkExperience});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    isVerified = json['is_verified'];
    roles = json['roles'].cast<String>();
    hasFilledProfileInfo = json['has_filled_profile_info'];
    hasFilledEducationInfo = json['has_filled_education_info'];
    hasFilledWorkExperience = json['has_filled_work_experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['email'] = email;
    data['is_verified'] = isVerified;
    data['roles'] = roles;
    data['has_filled_profile_info'] = hasFilledProfileInfo;
    data['has_filled_education_info'] = hasFilledEducationInfo;
    data['has_filled_work_experience'] = hasFilledWorkExperience;
    return data;
  }
}