import 'dart:convert';

class CurrentUser {
  int id;
  String token;
  int venderId;
  String firstName;
  String lastName;
  String company;
  String username;
  String email;
  String password;
  String mobile;
  String userAddress;
  String city;
  String country;
  String notes;
  String state;
  int zip;
  String profilePicture;
  String fullName;
  String userType;
  String userCode;
  String dob;
  String joiningDate;
  int age;
  int roleId;
  bool isDeleted;
  int creatorId;
  String deletorId;
  String updatorId;
  String creationTime;
  String deletionTime;
  String updationTime;
  String referalCode;
  String bgpassword;

  CurrentUser.empty({
    this.id = 0,
    this.token = '',
    this.venderId = 0,
    this.firstName = '',
    this.lastName = '',
    this.company = '',
    this.username = '',
    this.email = '',
    this.password = '',
    this.mobile = '',
    this.userAddress = '',
    this.city = '',
    this.country = '',
    this.notes = '',
    this.state = '',
    this.zip = 0,
    this.profilePicture = '',
    this.fullName = '',
    this.userType = '',
    this.userCode = '',
    this.dob = '',
    this.joiningDate = '',
    this.age = 0,
    this.roleId = 0,
    this.isDeleted = false,
    this.creatorId = 0,
    this.deletorId = '',
    this.updatorId = '',
    this.creationTime = '',
    this.deletionTime = '',
    this.updationTime = '',
    this.referalCode = '',
    this.bgpassword = '',
  });

  CurrentUser({
    required this.id,
    required this.token,
    required this.venderId,
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.username,
    required this.email,
    required this.password,
    required this.mobile,
    required this.userAddress,
    required this.city,
    required this.country,
    required this.notes,
    required this.state,
    required this.zip,
    required this.profilePicture,
    required this.fullName,
    required this.userType,
    required this.userCode,
    required this.dob,
    required this.joiningDate,
    required this.age,
    required this.roleId,
    required this.isDeleted,
    required this.creatorId,
    required this.deletorId,
    required this.updatorId,
    required this.creationTime,
    required this.deletionTime,
    required this.updationTime,
    required this.referalCode,
    required this.bgpassword,
  });

  CurrentUser copyWith({
    int? id,
    String? token,
    int? venderId,
    String? firstName,
    String? lastName,
    String? company,
    String? username,
    String? email,
    String? password,
    String? mobile,
    String? userAddress,
    String? city,
    String? country,
    String? notes,
    String? state,
    int? zip,
    String? profilePicture,
    String? fullName,
    String? userType,
    String? userCode,
    String? dob,
    String? joiningDate,
    int? age,
    int? roleId,
    bool? isDeleted,
    int? creatorId,
    String? deletorId,
    String? updatorId,
    String? creationTime,
    String? deletionTime,
    String? updationTime,
    String? referalCode,
    String? bgpassword,
  }) {
    return CurrentUser(
      id: id ?? this.id,
      token: token ?? this.token,
      venderId: venderId ?? this.venderId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      company: company ?? this.company,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      userAddress: userAddress ?? this.userAddress,
      city: city ?? this.city,
      country: country ?? this.country,
      notes: notes ?? this.notes,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      profilePicture: profilePicture ?? this.profilePicture,
      fullName: fullName ?? this.fullName,
      userType: userType ?? this.userType,
      userCode: userCode ?? this.userCode,
      dob: dob ?? this.dob,
      joiningDate: joiningDate ?? this.joiningDate,
      age: age ?? this.age,
      roleId: roleId ?? this.roleId,
      isDeleted: isDeleted ?? this.isDeleted,
      creatorId: creatorId ?? this.creatorId,
      deletorId: deletorId ?? this.deletorId,
      updatorId: updatorId ?? this.updatorId,
      creationTime: creationTime ?? this.creationTime,
      deletionTime: deletionTime ?? this.deletionTime,
      updationTime: updationTime ?? this.updationTime,
      referalCode: referalCode ?? this.referalCode,
      bgpassword: bgpassword ?? this.bgpassword,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'token': token});
    result.addAll({'venderId': venderId});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'company': company});
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'mobile': mobile});
    result.addAll({'userAddress': userAddress});
    result.addAll({'city': city});
    result.addAll({'country': country});
    result.addAll({'notes': notes});
    result.addAll({'state': state});
    result.addAll({'zip': zip});
    result.addAll({'profilePicture': profilePicture});
    result.addAll({'fullName': fullName});
    result.addAll({'userType': userType});
    result.addAll({'userCode': userCode});
    result.addAll({'dob': dob});
    result.addAll({'joiningDate': joiningDate});
    result.addAll({'age': age});
    result.addAll({'roleId': roleId});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'creatorId': creatorId});
    result.addAll({'deletorId': deletorId});
    result.addAll({'updatorId': updatorId});
    result.addAll({'creationTime': creationTime});
    result.addAll({'deletionTime': deletionTime});
    result.addAll({'updationTime': updationTime});
    result.addAll({'referalCode': referalCode});
    result.addAll({'bgpassword': bgpassword});

    return result;
  }

  factory CurrentUser.fromMap(Map<String, dynamic> map) {
    return CurrentUser(
      id: map['id']?.toInt() ?? 0,
      token: map['token'] ?? '',
      venderId: map['venderId']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      company: map['company'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      mobile: map['mobile'] ?? '',
      userAddress: map['userAddress'] ?? map['address'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      notes: map['notes'] ?? '',
      state: map['state'] ?? '',
      zip: map['zip']?.toInt() ?? 0,
      profilePicture: map['profilePicture'] ?? '',
      fullName: map['fullName'] ?? '',
      userType: map['userType'] ?? '',
      userCode: map['userCode'] ?? '',
      dob: map['dob'] ?? '',
      joiningDate: map['joiningDate'] ?? '',
      age: map['age']?.toInt() ?? 0,
      roleId: map['roleId']?.toInt() ?? 0,
      isDeleted: map['isDeleted'] ?? false,
      creatorId: map['creatorId']?.toInt() ?? 0,
      deletorId: map['deletorId'] ?? '',
      updatorId: map['updatorId'] ?? '',
      creationTime: map['creationTime'] ?? '',
      deletionTime: map['deletionTime'] ?? '',
      updationTime: map['updationTime'] ?? '',
      referalCode: map['referalCode'] ?? '',
      bgpassword: map['bgpassword'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentUser.fromJson(String source) =>
      CurrentUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CurrentUser(id: $id, token: $token, venderId: $venderId, firstName: $firstName, lastName: $lastName, company: $company, username: $username, email: $email, password: $password, mobile: $mobile, userAddress: $userAddress, city: $city, country: $country, notes: $notes, state: $state, zip: $zip, profilePicture: $profilePicture, fullName: $fullName, userType: $userType, userCode: $userCode, dob: $dob, joiningDate: $joiningDate, age: $age, roleId: $roleId, isDeleted: $isDeleted, creatorId: $creatorId, deletorId: $deletorId, updatorId: $updatorId, creationTime: $creationTime, deletionTime: $deletionTime, updationTime: $updationTime, referalCode: $referalCode, bgpassword: $bgpassword)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentUser &&
        other.id == id &&
        other.token == token &&
        other.venderId == venderId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.company == company &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.mobile == mobile &&
        other.userAddress == userAddress &&
        other.city == city &&
        other.country == country &&
        other.notes == notes &&
        other.state == state &&
        other.zip == zip &&
        other.profilePicture == profilePicture &&
        other.fullName == fullName &&
        other.userType == userType &&
        other.userCode == userCode &&
        other.dob == dob &&
        other.joiningDate == joiningDate &&
        other.age == age &&
        other.roleId == roleId &&
        other.isDeleted == isDeleted &&
        other.creatorId == creatorId &&
        other.deletorId == deletorId &&
        other.updatorId == updatorId &&
        other.creationTime == creationTime &&
        other.deletionTime == deletionTime &&
        other.updationTime == updationTime &&
        other.referalCode == referalCode &&
        other.bgpassword == bgpassword;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        token.hashCode ^
        venderId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        company.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        mobile.hashCode ^
        userAddress.hashCode ^
        city.hashCode ^
        country.hashCode ^
        notes.hashCode ^
        state.hashCode ^
        zip.hashCode ^
        profilePicture.hashCode ^
        fullName.hashCode ^
        userType.hashCode ^
        userCode.hashCode ^
        dob.hashCode ^
        joiningDate.hashCode ^
        age.hashCode ^
        roleId.hashCode ^
        isDeleted.hashCode ^
        creatorId.hashCode ^
        deletorId.hashCode ^
        updatorId.hashCode ^
        creationTime.hashCode ^
        deletionTime.hashCode ^
        updationTime.hashCode ^
        referalCode.hashCode ^
        bgpassword.hashCode;
  }
}
