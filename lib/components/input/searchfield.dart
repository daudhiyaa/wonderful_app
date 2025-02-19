import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;

  const SearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = "Cari Voucher",
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(fontFamily: 'MaisonNeue'),
      decoration: InputDecoration(
        labelStyle: const TextStyle(fontFamily: 'MaisonNeue'),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: const Icon(CupertinoIcons.search),
      ),
    );
  }
}
