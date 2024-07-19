import 'package:ticketorium_app_project/data/repositories/authentication.dart';
import 'package:ticketorium_app_project/data/repositories/user_repository.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/entities/user/user.dart';
import 'package:ticketorium_app_project/domain/usecases/register_usecase/register_param.dart';
import 'package:ticketorium_app_project/domain/usecases/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParam> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  Register({
    required Authentication authentication, 
    required UserRepository userRepository
  }) 
  : _authentication = authentication, _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParam params) async {
    var uidResult = await _authentication.register(email: params.email, password: params.password);

    if(uidResult.isSuccess){
      var userResult = await _userRepository.createUser(
        uid: uidResult.resultValue!, 
        email: params.email, 
        name: params.name,
        photoUrl: params.photoUrl,
      );
      if(userResult.isSuccess){
        return Result.success(userResult.resultValue!);
      }else{
        return Result.failed(userResult.errorMessage!);
      }
    }else{
      return Result.failed(uidResult.errorMessage!);
    }
  }

}