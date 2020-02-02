import 'package:flutter/material.dart';

class RoundedMaterialTextFormField extends StatelessWidget {
  final Function(String value) onChanged, validator;
  final Widget prefixIcon, suffixIcon;
  final String hintText, initialValue;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool disabled, obscureText;
  final FocusNode focus, nextFocus;
  final TextEditingController controller;
  final TextStyle style;
  final TextAlign textAlign;

  RoundedMaterialTextFormField({
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.focus,
    this.style,
    this.textAlign = TextAlign.left,
    this.nextFocus,
    this.disabled = false,
    this.textInputAction,
    this.suffixIcon,
    this.initialValue,
    this.obscureText = false,
    this.controller,
    @required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      onChanged: this.onChanged,
      enabled: !disabled,
      textAlign: textAlign,
      validator: validator,
      focusNode: focus,
      obscureText: obscureText,
      style: style ?? TextStyle(),
      textInputAction: this.textInputAction ??
          (nextFocus != null ? TextInputAction.next : TextInputAction.done),
      onFieldSubmitted: (v) {
        if (this.nextFocus != null) {
          FocusScope.of(context).requestFocus(this.nextFocus);
        }
      },
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        labelText: hintText ?? "Enter value",
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: disabled ? true : false,
        fillColor: Colors.grey[200],
        disabledBorder: new OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]),
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
