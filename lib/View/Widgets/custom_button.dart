import 'package:flutter/material.dart';

import '../../Constants/app_colors.dart';
import '../../Constants/app_defaults.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.title});

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(AppColors.DARK_PURPLE),padding: const MaterialStatePropertyAll(EdgeInsets.zero), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: SizedBox(
        height: 48,
        width: 190,
        child: Center(
          child: Text(
            title,
            style: AppDefaults.textStyleBold16(fontColor: Colors.white),
          ),
        ),
      ),
    );
  }
}