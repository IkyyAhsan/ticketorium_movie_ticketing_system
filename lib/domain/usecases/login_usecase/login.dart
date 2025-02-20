import 'package:ticketorium_app_project/data/repositories/authentication.dart';
import 'package:ticketorium_app_project/data/repositories/user_repository.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/entities/user/user.dart';
import 'package:ticketorium_app_project/domain/usecases/usecase.dart';

part 'login_params.dart';

class Login implements UseCase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;

  Login({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await authentication.login(
      email: params.email, password: params.password);

    if (idResult is Success){
      var userResult = await userRepository.getUser(uid: idResult.resultValue!);

      return switch(userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}