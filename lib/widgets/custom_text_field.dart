import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final String? hintText;
  final String? errorText;
  final bool isValid;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.borderRadius = 8.0,
    this.borderColor ,
    this.borderWidth = 1.0,
    this.contentPaddingVertical = 12.0,
    this.contentPaddingHorizontal = 16.0,
    this.hintText,
    this.errorText,
    this.isValid = true,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.red,
            focusNode: focusNode,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: contentPaddingVertical!,
                horizontal: contentPaddingHorizontal!,
              ),
              hintText: hintText ?? "Add hint text",

              border: InputBorder.none,
            ),
          ),
        ),

        if (!isValid && errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
