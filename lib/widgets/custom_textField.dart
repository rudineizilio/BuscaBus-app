import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({
    this.hint,
    this.prefix,
    this.suffix,
    this.obscure = false,
    this.textInputType,
    this.onChanged, 
    this.enabled, 
    this.controller,
    this.initialValue,
    this.key,
  });

  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled;
  final String initialValue;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextFormField(
        key: key,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.bold,
        ),
        initialValue: initialValue,
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Theme.of(context).accentColor,
          ),
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
