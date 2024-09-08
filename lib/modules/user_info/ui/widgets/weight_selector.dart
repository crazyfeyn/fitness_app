import 'package:flutter/material.dart';

class WeightSelector extends StatelessWidget {
  int weight;
  Function(int) onWeightSelected;
  WeightSelector(
      {super.key, required this.weight, required this.onWeightSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              (weight + 1).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "kg",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            )
          ],
        ),
        SizedBox(
          height: 200,
          child: RotatedBox(
            quarterTurns: -1, // ListWheelScrollView ni gorizontal aylantirish
            child: ListWheelScrollView.useDelegate(
              itemExtent: 20,
              diameterRatio: 5,
              perspective: 0.01,
              onSelectedItemChanged: (index) {
                onWeightSelected(index);
              },
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return RotatedBox(
                    quarterTurns:
                        -1, // Ichki elementlarni to'g'ri holatga keltirish
                    child: Container(
                        width: 60,
                        height: weight == index
                            ? 120
                            : index % 5 == 0
                                ? 72
                                : 50,
                        alignment: Alignment.center,
                        child: Container(
                          width: 4,
                          color: const Color(0xFFD0FD3E),
                        )),
                  );
                },
                childCount: 200, // Elementlar soni
              ),
            ),
          ),
        ),
      ],
    );
  }
}
