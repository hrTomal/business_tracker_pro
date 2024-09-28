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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['access'] = this.access;
    data['refresh'] = this.refresh;
    data['message'] = this.message;
    return data;
  }
}
