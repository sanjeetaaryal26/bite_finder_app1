import 'package:bite_finder_app/features/auth/domain/entities/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AuthApiModel {
  final String? id;
  final String email;
  final String? phoneNumber;
  final String username;
  final String? password;
  final String? confirmPassword;
  final String? profilePicture;

  AuthApiModel({
    this.id,
    this.profilePicture,
    required this.email,
    this.phoneNumber,
    required this.username,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'phoneNumber': phoneNumber,
      'username': username,
      'password': password,
      'confirmPassword': confirmPassword,
      'profilePicture': profilePicture,
      'email': email,
    };
  }

  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      id: json['_id'],
      email: json['email'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      profilePicture: json['profilePic'],
    );
  }

  // toEntity
  AuthEntity toEntity() {
    return AuthEntity(
      authId: id,
      email: email,
      phoneNumber: phoneNumber,
      username: username,
      password: password,
      profilePicture: profilePicture,
      confirmPassword: confirmPassword,
    );
  }

  // fromEntity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      username: entity.username,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
      profilePicture: entity.profilePicture,
    );
  }

  // toEntityList
  static List<AuthEntity> toEntityList(List<AuthApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
