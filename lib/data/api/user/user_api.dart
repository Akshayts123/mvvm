import 'package:lilac_mvvm_user/common/network/api_helper.dart';
import 'package:lilac_mvvm_user/core/api_config.dart';

import '../../../common/network/dio_client.dart';
import '../../model/user/user.dart';

class UserApi with ApiHelper<User> {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  //Get Api
  Future<List<User>> getUsers({Gender? gender, UserStatus? status}) async {
    Map<String, String> queryParameters = <String, String>{};

    if (gender != null && gender != Gender.all) {
      queryParameters.addAll({'gender': gender.name});
    }

    if (status != null && status != UserStatus.all) {
      queryParameters.addAll({'status': status.name});
    }
    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.users, queryParameters: queryParameters),
        User.fromJson);
  }
}


