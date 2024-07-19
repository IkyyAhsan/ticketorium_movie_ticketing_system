import 'dart:io';
import 'package:ticketorium_app_project/domain/entities/user/user.dart';

class UploadProfilePictureParam {
  final File imageFile;
  final User user;

  UploadProfilePictureParam(this.user, {required this.imageFile});
}