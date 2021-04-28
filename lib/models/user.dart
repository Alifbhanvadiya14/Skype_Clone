class UserDetails {
  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profilePhoto;

  UserDetails({
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.profilePhoto,
  });

  Map toMap(UserDetails user) {
    var data = Map<String, dynamic>();

    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data['status'] = user.status;
    data['state'] = user.state;
    data['profilePhoto'] = user.profilePhoto;

    return data;
  }

  UserDetails.fromMap(Map<String, dynamic> map) {
    UserDetails(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      username: map['username'],
      status: map['status'],
      state: map['state'],
      profilePhoto: map['profilePhoto'],
    );
  }
}
