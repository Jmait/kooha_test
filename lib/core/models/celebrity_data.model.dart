class CelebrityDataModel {
  bool? success;
  String? message;
  Data? data;

  CelebrityDataModel({this.success, this.message, this.data});

  CelebrityDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Records>? records;
  int? count;

  Data({this.records, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Records {
  String? uuid;
  String? fullName;
  String? userName;
  String? occupation;
  String? profileImagePath;
  String? email;
  String? dateOfBirth;
  String? bio;
  String? pin;
  bool? isEmailVerified;
  String? type;
  bool? activeNotification;
  bool? informationSubscription;
  String? eligibility;
  String? createdAtDateOnly;
  String? status;
  String? createdAt;
  String? updatedAt;
  Influencer? influencer;
  Fee? fee;

  Records(
      {this.uuid,
      this.fullName,
      this.userName,
      this.occupation,
      this.profileImagePath,
      this.email,
      this.dateOfBirth,
      this.bio,
      this.pin,
      this.isEmailVerified,
      this.type,
      this.activeNotification,
      this.informationSubscription,
      this.eligibility,
      this.createdAtDateOnly,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.influencer,
      this.fee});

  Records.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    fullName = json['fullName'];
    userName = json['userName'];
    occupation = json['occupation'];
    profileImagePath = json['profileImagePath'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    bio = json['bio'];
    pin = json['pin'];
    isEmailVerified = json['isEmailVerified'];
    type = json['type'];
    activeNotification = json['activeNotification'];
    informationSubscription = json['informationSubscription'];
    eligibility = json['eligibility'];
    createdAtDateOnly = json['createdAtDateOnly'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    influencer = json['influencer'] != null
        ? new Influencer.fromJson(json['influencer'])
        : null;
    fee = json['fee'] != null ? new Fee.fromJson(json['fee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['occupation'] = this.occupation;
    data['profileImagePath'] = this.profileImagePath;
    data['email'] = this.email;
    data['dateOfBirth'] = this.dateOfBirth;
    data['bio'] = this.bio;
    data['pin'] = this.pin;
    data['isEmailVerified'] = this.isEmailVerified;
    data['type'] = this.type;
    data['activeNotification'] = this.activeNotification;
    data['informationSubscription'] = this.informationSubscription;
    data['eligibility'] = this.eligibility;
    data['createdAtDateOnly'] = this.createdAtDateOnly;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.influencer != null) {
      data['influencer'] = this.influencer!.toJson();
    }
    if (this.fee != null) {
      data['fee'] = this.fee!.toJson();
    }
    return data;
  }
}

class Influencer {
  String? uuid;
  String? country;
  String? socialMedia;
  String? handle;
  String? followers;
  String? idType;
  String? idNumber;
  String? dateOfBirth;
  String? documentImagePath;
  String? userId;
  int? views;
  String? pin;
  bool? isFeatured;
  String? createdAtDateOnly;
  String? createdAt;
  String? updatedAt;

  Influencer(
      {this.uuid,
      this.country,
      this.socialMedia,
      this.handle,
      this.followers,
      this.idType,
      this.idNumber,
      this.dateOfBirth,
      this.documentImagePath,
      this.userId,
      this.views,
      this.pin,
      this.isFeatured,
      this.createdAtDateOnly,
      this.createdAt,
      this.updatedAt});

  Influencer.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    country = json['country'];
    socialMedia = json['socialMedia'];
    handle = json['handle'];
    followers = json['followers'];
    idType = json['idType'];
    idNumber = json['idNumber'];
    dateOfBirth = json['dateOfBirth'];
    documentImagePath = json['documentImagePath'];
    userId = json['userId'];
    views = json['views'];
    pin = json['pin'];
    isFeatured = json['isFeatured'];
    createdAtDateOnly = json['createdAtDateOnly'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['country'] = this.country;
    data['socialMedia'] = this.socialMedia;
    data['handle'] = this.handle;
    data['followers'] = this.followers;
    data['idType'] = this.idType;
    data['idNumber'] = this.idNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['documentImagePath'] = this.documentImagePath;
    data['userId'] = this.userId;
    data['views'] = this.views;
    data['pin'] = this.pin;
    data['isFeatured'] = this.isFeatured;
    data['createdAtDateOnly'] = this.createdAtDateOnly;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Fee {
  String? uuid;
  String? userId;
  String? celebrityId;
  int? bookingFee;
  int? directMessageFee;
  bool? isBookingFeeAdded;
  bool? isdirectMessageFeeAdded;
  String? createdAt;
  String? updatedAt;

  Fee(
      {this.uuid,
      this.userId,
      this.celebrityId,
      this.bookingFee,
      this.directMessageFee,
      this.isBookingFeeAdded,
      this.isdirectMessageFeeAdded,
      this.createdAt,
      this.updatedAt});

  Fee.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    userId = json['userId'];
    celebrityId = json['celebrityId'];
    bookingFee = json['bookingFee'];
    directMessageFee = json['directMessageFee'];
    isBookingFeeAdded = json['isBookingFeeAdded'];
    isdirectMessageFeeAdded = json['isdirectMessageFeeAdded'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['userId'] = this.userId;
    data['celebrityId'] = this.celebrityId;
    data['bookingFee'] = this.bookingFee;
    data['directMessageFee'] = this.directMessageFee;
    data['isBookingFeeAdded'] = this.isBookingFeeAdded;
    data['isdirectMessageFeeAdded'] = this.isdirectMessageFeeAdded;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
