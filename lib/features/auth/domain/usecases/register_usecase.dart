import 'package:bite_finder_app/core/error/failures.dart';
import 'package:bite_finder_app/core/usecases/app_usecase.dart';
import 'package:bite_finder_app/features/auth/data/repositories/auth_repository.dart';
import 'package:bite_finder_app/features/auth/domain/entities/auth_entity.dart';
import 'package:bite_finder_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterParams extends Equatable {
  final String fullName;
  final String email;
  final String username;
  final String password;
  final String? phoneNumber;
  final String? uid;
  final String? confirmPassword;

  const RegisterParams({
    required this.fullName,
    required this.email,
    required this.username,
    required this.password,
    this.phoneNumber,
    this.uid,
    this.confirmPassword
  });

  @override
  List<Object?> get props => [
    fullName,
    email,
    username,
    password,
    phoneNumber,
    uid,
    confirmPassword
  ];
}

// Create Provider
final registerUsecaseProvider = Provider<RegisterUsecase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return RegisterUsecase(authRepository: authRepository);
});

class RegisterUsecase implements UsecaseWithParms<bool, RegisterParams> {
  final IAuthRepository _authRepository;

  RegisterUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, bool>> call(RegisterParams params) {
    final authEntity = AuthEntity(
      email: params.email,
      username: params.username,
      password: params.password,
      phoneNumber: params.phoneNumber,
      confirmPassword: params.confirmPassword
    );

    return _authRepository.register(authEntity);
  }
}
