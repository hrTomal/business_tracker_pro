class RegisterResponse {
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? access;
  String? refresh;
  String? message;

  RegisterResponse(
      {this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.access,
      this.refresh,
      this.message});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    access = json['access'];
    refresh = json['refresh'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['access'] = access;
    data['refresh'] = refresh;
    data['message'] = message;
    return data;
  }
}
