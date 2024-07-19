import 'package:ticketorium_app_project/data/repositories/user_repository.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/entities/user/user.dart';
import 'package:ticketorium_app_project/domain/usecases/upload_profile_picture/upload_profile_picture_param.dart';
import 'package:ticketorium_app_project/domain/usecases/usecase.dart';

class UploadProfilePicture implements UseCase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;

  

  UploadProfilePicture({
    required UserRepository userRepository}) 
    : _userRepository = userRepository;

  @override
  Future<Result<User>> call(UploadProfilePictureParam params) async => 
  _userRepository.uploadProfilePicture(
    user: params.user, 
    imageFile: params.imageFile
  );
}