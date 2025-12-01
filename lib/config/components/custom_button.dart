import 'package:bloc_clean_architecture/core/utils/exceptions/theme_exception.dart';
import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CustomButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: context.theme.textTheme.titleMedium!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
