

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:lilac_mvvm_user/common/controller/base_controller.dart';
import 'package:lilac_mvvm_user/data/model/user/user.dart';

import '../../../repository/user/user_repository.dart';

class UserController extends GetxController with StateMixin<List<User>>, BaseController{
  final UserRepository userRepository;
  UserController({required this.userRepository});

  Future<void> getUserList({Gender gender =Gender.all,UserStatus status = UserStatus.all})async{
    change(null, status: RxStatus.loading());
    Either<String,List<User>> failureOrSuccuss = (await userRepository.getUsers(gender: gender,status: status));

    failureOrSuccuss.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (List<User> users){
      if (users.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(users, status: RxStatus.success());
      }
    });
  }

}