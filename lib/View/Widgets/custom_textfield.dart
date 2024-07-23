import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Constants/app_colors.dart';
import '../../Constants/app_defaults.dart';
import '../../Constants/app_sizes.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.prefixIcon, this.controller, this.validator, this.keyboardType, this.maxLength, this.obscureText, this.textAlign, this.textInputAction, this.onEditingComplete, this.suffixIcon, this.counterText, this.label, this.enabled, this.isSmall, this.readOnly, this.inputFormatters, this.onChanged, this.maxLines, this.onBarcodeScan, this.autoValidateMode, this.autofocus, this.focusNode, this.items, this.onTap,});
  final TextEditingController? controller;
  final String? hintText;
  final String? counterText;
  final String? label;
  final void Function()? onTap;
  final String? items;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLength;
  final int? maxLines;
  final bool? obscureText;
  final bool? enabled;
  final bool? autofocus;
  final bool? isSmall;
  final bool? readOnly ;
  final AutovalidateMode? autoValidateMode;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function()? onBarcodeScan;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null?
        Text(label ?? "", style:AppDefaults.textStyleBold16(fontColor: AppColors.DARK_PURPLE),):const SizedBox(),
        label != null?
        AppSizes.hGap8: const SizedBox(),
        TextFormField(
          onTap: onTap,
          controller: controller,
          style: AppDefaults.textFieldSemiBold14,
          autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
          autofocus: autofocus ?? false,
          focusNode: focusNode,
          validator: validator,
          keyboardType: keyboardType,
          textAlign: textAlign ?? TextAlign.start,
          maxLength: maxLength,
          readOnly:readOnly??false ,
          obscureText: obscureText ?? false,
          textInputAction: textInputAction ?? TextInputAction.next,
          onEditingComplete: onEditingComplete,
          onChanged: onChanged,
          enabled: enabled,
          maxLines: maxLines ?? 1,
          textCapitalization: keyboardType != TextInputType.emailAddress && keyboardType != TextInputType.visiblePassword ? TextCapitalization.sentences : TextCapitalization.none,
          inputFormatters: keyboardType == TextInputType.number ? [FilteringTextInputFormatter.digitsOnly] : inputFormatters ?? [
            FilteringTextInputFormatter.deny(
                RegExp(r' \s')),
          ],
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppDefaults.hintTextMedium12,
              counterText: counterText ?? "",
              prefixIcon: prefixIcon,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
              errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.errorColor)),
              filled: true,
              fillColor: AppColors.LIGHT_PURPLE.withOpacity(0.3),
              suffixIcon: suffixIcon
          ),
        ),
      ],
    );
  }
}