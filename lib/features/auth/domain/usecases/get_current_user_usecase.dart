import 'package:bite_finder_app/core/error/failures.dart';
import 'package:bite_finder_app/core/usecases/app_usecase.dart';
import 'package:bite_finder_app/features/auth/data/repositories/auth_repository.dart';
import 'package:bite_finder_app/features/auth/domain/entities/auth_entity.dart';
import 'package:bite_finder_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Create Provider
final getCurrentUserUsecaseProvider = Provider<GetCurrentUserUsecase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return GetCurrentUserUsecase(authRepository: authRepository);
});

class GetCurrentUserUsecase implements UsecaseWithoutParms<AuthEntity> {
  final IAuthRepository _authRepository;

  GetCurrentUserUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, AuthEntity>> call() {
    return _authRepository.getCurrentUser("N/A");
  }
}
