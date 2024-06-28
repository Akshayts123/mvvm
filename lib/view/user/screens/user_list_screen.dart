import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_mvvm_user/common/widget/popup_menu.dart';
import 'package:lilac_mvvm_user/core/app_extensions.dart';

import '../../../common/dialog/retry_dialog.dart';
import '../../../common/widget/empty_widget.dart';
import '../../../common/widget/spinkit_indicator.dart';
import '../../../data/model/user/user.dart';
import '../../../di.dart';
import '../../../viewmodel/user/controller/user_controller.dart';


enum UserOperation { edit, delete, post, todo }

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserController _controller = getIt<UserController>();

  PreferredSizeWidget get _appbar {
    return AppBar(
      leading: IconButton(
        onPressed:_controller.getUserList,
        icon: Icon(
          Icons.refresh,
          color: Theme.of(context).cardColor,
        ),
      ),
      actions: [
        PopupMenu<UserStatus>(
          icon: Icons.filter_list,
          items: UserStatus.values,
          onChanged: (UserStatus value) {
            _controller.getUserList(status: value);
          },
        ),
        PopupMenu<Gender>(
          icon: Icons.filter_alt,
          items: Gender.values,
          onChanged: (Gender value) =>_controller.getUserList(gender: value),
        )
      ],
    );
  }
  @override
  void initState() {
    _controller.getUserList();
    super.initState();
  }
  Widget userListItem(User user ){
    return Card(
      child: Row(
          children: [
      Image.asset(user.gender.name.getGenderWidget, height: 75),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, ),
              const SizedBox(height: 10),
              Text(user.email, )
            ],
          ),
        ),],),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: _controller.obx(
            (state) => ListView.builder(
          shrinkWrap: true,
          itemCount: state?.length,
          itemBuilder: (_, index) {
            User user = state![index];
            return userListItem(user).marginSymmetric(horizontal: 10);
          },
        ),
        onLoading: const SpinKitIndicator(type: SpinKitType.circle),
        onError: (error) => RetryDialog(
          title: "$error",
          onRetryPressed: () => _controller.getUserList(),
        ),
        onEmpty: const EmptyWidget(message: "No user!"),
      ),
    );
  }
}
