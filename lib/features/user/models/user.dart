import 'package:super_flutter/super_flutter.dart';

class UserModel extends BaseModel {
  String? id;
  String? ipAddress;

  // String? username;
  String? email;
  String? mobile;
  String? image;
  String? balance;
  String? activationSelector;
  String? userProfile;
  String? address;
  String? dob;
  String? city;
  String? area;
  String? street;
  String? password;
  String? pinCode;
  String? fcmId;
  String? latitude;
  String? longitude;
  String? userId;
  String? name;
  String? deliveryCharge;
  String? freeAmt;
  String? type;
  String? altMob;
  String? landmark;
  String? areaId;
  String? cityId;
  bool isDefault;
  String? state;
  String? country;
  String? countryCode;
  String? date;
  String? comment;
  String? rating;
  String? lastLogin;
  String? company;
  String? active;
  String? bonus;
  String? fcmToken;
  String? serviceableZipcodes;
  String? apikey;
  String? referralCode;
  String? friendsCode;

  List<String>? imgList;

  UserModel({
    // this.username,
    this.userProfile,
    this.email,
    this.mobile,
    this.address,
    this.dob,
    this.city,
    this.area,
    this.street,
    this.password,
    this.pinCode,
    this.fcmId,
    this.latitude,
    this.longitude,
    this.userId,
    this.name,
    this.deliveryCharge,
    this.freeAmt,
    this.type,
    this.altMob,
    this.landmark,
    this.areaId,
    this.cityId,
    this.isDefault = false,
    this.state,
    this.country,
    this.id,
    this.date,
    this.comment,
    this.rating,
    this.imgList,
    this.fcmToken,
    this.countryCode,
    this.ipAddress,
    this.image,
    this.balance,
    this.activationSelector,
    this.lastLogin,
    this.company,
    this.bonus,
    this.serviceableZipcodes,
    this.apikey,
    this.referralCode,
    this.friendsCode,
    this.active,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'ip_address': ipAddress,
        // 'username': username,
        'username': name,
        'email': email,
        'mobile': mobile,
        'image': image,
        'balance': balance,
        'activation_selector': activationSelector,
        'active': active,
        'company': company,
        'address': address,
        'bonus': bonus,
        'dob': dob,
        'country_code': countryCode,
        'city': cityId,
        'area': area,
        'street': street,
        'pincode': pinCode,
        'serviceable_zipcodes': serviceableZipcodes,
        'apikey': apikey,
        'referral_code': referralCode,
        'friends_code': friendsCode,
        'fcm_id': fcmToken,
        'latitude': latitude,
        'longitude': longitude,
      };

  Future<Map<String, dynamic>> toUpdate(imagePath) async {
    var temp = imagePath != null
        ? await BaseModel.fromMultipartFile(imagePath)
        : image;

    return {
      'user_id': id,
      'username': name,
      'mobile': mobile,
      'email': email,
      'address': address,
      'area': area,
      'city': cityId,
      'pincode': pinCode,
      'referral_code': referralCode,
      'image': temp,
    };
  }

  Map<String, dynamic> toRegister() => {
        'name': name,
        'email': email,
        'mobile': mobile,
        'country_code': countryCode ?? '+967',
        'city': cityId,
        'fcm_id': fcmId,
        'password': password,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      id: map['id'],
      ipAddress: map['ip_address'],
      name: map['username'],
      email: map['email'],
      mobile: map['mobile'],
      image: map['image'],
      balance: map['balance'],
      activationSelector: map['activation_selector'],
      active: map['active'],
      company: map['company'],
      address: map['address'],
      bonus: map['bonus'],
      dob: map['dob'],
      countryCode: map['country_code'],
      cityId: map['city'],
      area: map['area'],
      street: map['street'],
      pinCode: map['pincode'],
      serviceableZipcodes: map['serviceable_zipcodes'],
      apikey: map['apikey'],
      referralCode: map['referral_code'],
      friendsCode: map['friends_code'],
      fcmToken: map['fcm_id'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      city: map['city_name'],
      password: map['password'],
      fcmId: map['fcmId'],
      userId: map['userId'],
      // name: map['name'],
      deliveryCharge: map['delivery_charge'],
      freeAmt: map['free_amt'],
      type: map['type'],
      altMob: map['alt_mob'],
      landmark: map['landmark'],
      areaId: map['areaId'],
      isDefault: map['is_default'] == '1' ? true : false,
      state: map['state'],
      country: map['country'],
      date: map['date'],
      comment: map['comment'],
      rating: map['rating'],
      lastLogin: map['last_login'],
    );

  Map<String, dynamic> toOTP() => {
        'mobile': mobile,
      };

  Map<String, dynamic> toLogin() => {
        'mobile': mobile,
        'password': password,
      };


  @override
  BaseModel fromJson(Map<String, dynamic> element) => UserModel.fromMap(element);

  @override
  List<BaseModel> fromJsonList(List elements) =>
      elements.map((item) => UserModel.fromMap(item)).toList();

  @override
  Map<String, dynamic> toJson() => toMap();
}
