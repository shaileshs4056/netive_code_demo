// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      email: json['email'] as String?,
      userType: json['user_type'] as String?,
      loginType: json['login_type'] as String?,
      deviceType: json['device_type'] as String?,
      deviceToken: json['device_token'] as String?,
      countryCode: json['country_code'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      ip: json['ip'] as String?,
      uuid: json['uuid'] as String?,
      osVersion: json['os_version'] as String?,
      deviceModel: json['device_model'] as String?,
      socialId: json['social_id'] as String?,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.userType case final value?) 'user_type': value,
      if (instance.loginType case final value?) 'login_type': value,
      if (instance.deviceType case final value?) 'device_type': value,
      if (instance.deviceToken case final value?) 'device_token': value,
      if (instance.countryCode case final value?) 'country_code': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.password case final value?) 'password': value,
      if (instance.address case final value?) 'address': value,
      if (instance.latitude case final value?) 'latitude': value,
      if (instance.longitude case final value?) 'longitude': value,
      if (instance.ip case final value?) 'ip': value,
      if (instance.uuid case final value?) 'uuid': value,
      if (instance.osVersion case final value?) 'os_version': value,
      if (instance.deviceModel case final value?) 'device_model': value,
      if (instance.socialId case final value?) 'social_id': value,
    };
