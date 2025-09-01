// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String name;
  CustomButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Colors.white.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 6,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: const Center(
            child: Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            fontFamily: "Poppins",
          ),
        )),
      ),
    );
  }
}
