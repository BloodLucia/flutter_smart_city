class UserMo {
  int? userId;
  String? userName;
  String? nickName;
  String? email;
  String? phonenumber;
  String? sex;
  String? avatar;
  String? idCard;
  double? balance;
  int? score;

  UserMo({
    this.userId,
    this.userName,
    this.nickName,
    this.email,
    this.phonenumber,
    this.sex,
    this.avatar,
    this.idCard,
    this.balance,
    this.score,
  });

  UserMo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    nickName = json['nickName'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    sex = json['sex'];
    avatar = json['avatar'];
    idCard = json['idCard'];
    balance = json['balance'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
    data['nickName'] = nickName;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['sex'] = sex;
    data['avatar'] = avatar;
    data['idCard'] = idCard;
    data['balance'] = balance;
    data['score'] = score;
    return data;
  }
}
