// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lilac_test/features/home/home.dart';
import '../../core/components/buttons.dart';

class ThrSplash extends StatelessWidget {
  const ThrSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.fitHeight)),
   
   child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Catch Every \nBlockbuster \nWithout the Queue",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              fontFamily: "Poppins",
            ),
          ),
           GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
              child: CustomButton(name: "next")),
        ],
      ),
    );
  }
}
