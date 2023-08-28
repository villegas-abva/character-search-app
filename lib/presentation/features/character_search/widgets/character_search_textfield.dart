import 'package:flutter/material.dart';

class CharacterSearchTextfield extends StatelessWidget {
  const CharacterSearchTextfield({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? hintText;

  OutlineInputBorder get searchBarBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue.shade900,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(6.0),
      );

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        border: searchBarBorder,
        focusedBorder: searchBarBorder,
        enabledBorder: searchBarBorder,
        hintText: hintText,
        prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 6.0, bottom: 1),
            child: Icon(Icons.search)),
        filled: true,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        fillColor: Colors.blue.shade100,
      ),
    );
  }
}
