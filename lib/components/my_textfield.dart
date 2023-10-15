import 'package:flutter/material.dart';

class MyFormField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  final String Function(String value) validator;
  final void Function(String value) updateParentValue;

  const MyFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.updateParentValue,
    required this.obscureText, required this.validator, required child
  });

  @override
  State<MyFormField> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  // ignore: avoid_init_to_null
  String? errorText = null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        onChanged: (value) {
          //print(value);
          widget.controller.text = value;
          setState(() {
            var errtxt = widget.validator(widget.controller.text); 
            errorText =((errtxt.isEmpty) ? null : errtxt);
            widget.updateParentValue(errtxt);
          });
        },
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorText: errorText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}