import 'package:flutter/material.dart';


typedef dynamic OnValidation(String? text);

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final String hint;
  final int maxLine;
  final Widget? suffixIcon;
  final OnValidation? validator;
  final Function(String?)? onChange;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const InputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.obscureText = false,
    this.hint = "",
    this.onChange,
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.validator, required this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLines: maxLine,
      controller: controller,
      focusNode: focusNode,
      autovalidateMode:AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 10.0),
        isDense: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.red)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.brown,
          ),
        ),
        suffixIcon: suffixIcon ?? null,
      ),
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType ?? TextInputType.name,
      onChanged: (val) {
        if (onChange != null) {
          onChange!(val);
        }
      },
      validator: (val) {
        if (validator != null) {
          return validator!(val);
        } else {
          return null;
        }
      },
    );
  }
}

class ValidationUtils {
  static bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return (!RegExp(pattern).hasMatch(value)) ? false : true;
  }
}
