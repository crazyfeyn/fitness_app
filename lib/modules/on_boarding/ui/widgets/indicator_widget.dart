import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  final int currentIndex;
  final int totalIndicators;

  const IndicatorWidget({
    super.key,
    required this.currentIndex,
    required this.totalIndicators,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(totalIndicators, (index) {
            return Container(
              padding: index == currentIndex
                  ? const EdgeInsets.symmetric(horizontal: 15, vertical: 5)
                  : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(
                    index == currentIndex ? 20 : 50),
                color: index == currentIndex
                    ? const Color(0xFFFFBC1D)
                    : const Color(0xFF383A42),
              ),
            );
          }),
        ),
      ),
    );
  }
}



//  Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadiusDirectional.circular(20),
//                       color: const Color(0xFFFFBC1D),
//                     ),
//                   ),
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadiusDirectional.circular(50),
//                       color: const Color(0xFF383A42),
//                     ),
//                   ),