import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? authId;
  final String email;
  final String? phoneNumber;
  final String username;
  final String? password;
  final String? profilePicture;
  final String? confirmPassword;

  const AuthEntity({
    this.authId,
    required this.email,
    this.phoneNumber,
    required this.username,
    this.password,
    this.profilePicture,
    this.confirmPassword
  });

  @override
  List<Object?> get props => [
    authId,
    email,
    phoneNumber,
    username,
    password,
    profilePicture,
    confirmPassword
  ];
}
