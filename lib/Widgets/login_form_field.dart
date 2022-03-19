import 'package:flutter/material.dart';

class loginFormField extends StatelessWidget {
  final String value;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final int maxLength;
  final bool autofocus;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? icon;
  final IconData? prefixIcon;
  final IconData? suffix;
  const loginFormField({
    Key? key, this.value='', 
    this.hintText, 
    this.labelText, 
    this.helperText, 
    this.maxLength = 50, 
    this.autofocus = false, 
    this.obscureText = false, 
    this.keyboardType = TextInputType.name, 
    this.icon, 
    this.prefixIcon, 
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
           
      initialValue: value,
      maxLength: maxLength,
      autofocus: autofocus,
      obscureText: obscureText,
      textCapitalization: !obscureText ? TextCapitalization.words : TextCapitalization.none,
      keyboardType: !obscureText ? keyboardType : TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        icon: icon == null ? null: Icon(icon),
        prefixIcon: prefixIcon == null ? null: Icon(prefixIcon),
        suffix: suffix == null ? null: Icon(suffix)
      ),
    );
  }
}