
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/data/firebase/firebase_authentication.dart';
import 'package:ticketorium_app_project/data/repositories/authentication.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) => FirebaseAuthentication();