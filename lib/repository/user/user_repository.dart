import 'package:dartz/dartz.dart';
import 'package:lilac_mvvm_user/common/repository/repository_helper.dart';
import 'package:lilac_mvvm_user/data/api/user/user_api.dart';
import 'package:lilac_mvvm_user/data/model/user/user.dart';

class UserRepository with RepositoryHelper<User>{
  final UserApi userApi;
  UserRepository({required this.userApi});
  
  Future<Either<String,List<User>>> getUsers({Gender? gender , UserStatus? status}) async{
    return checkItemsFailOrSuccess(userApi.getUsers(gender: gender,status: status));
  }
}