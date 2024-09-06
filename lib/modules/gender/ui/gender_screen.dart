import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Tell us about yourself!",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Integral CF",
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 2.5,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 65),
              child: Text(
                "To give you a better experience we need to know your gender",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: "Integral CF",
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMale = true;
                });
              },
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: isMale
                      ? const Color(0xFFD0FD3E)
                      : const Color(0xFF2C2C2E),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male,
                      size: 68,
                      color: isMale ? Colors.black : Colors.white,
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 15,
                        color: isMale ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 44,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMale = false;
                });
              },
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: isMale
                      ? const Color(0xFF2C2C2E)
                      : const Color(0xFFD0FD3E),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female,
                      size: 68,
                      color: isMale ? Colors.white : Colors.black,
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 15,
                        color: isMale ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD0FD3E),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}