import 'package:flutter/material.dart';

class AppInputText extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  final Function onSaved;

  AppInputText(this.label, this.hint, {this.password = false, this.controller,
    this.validator, this.keyboardType, this.textInputAction, this.onSaved}); // Entre chaves é opcional;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      onSaved: this.onSaved,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey),
          hintStyle: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
      style: TextStyle(fontSize: 42, color: Theme.of(context).primaryColor),
      textAlign: TextAlign.center,
    );
  }
}