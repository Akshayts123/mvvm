import 'package:flutter/material.dart';
import 'package:lilac_mvvm_user/core/app_style.dart';
import '../../core/app_assets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppAsset.emptyState),
          Text(message, style: poppinsRegular.copyWith()),
        ],
      ),
    );
  }
}
