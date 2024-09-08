import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActivitySelector extends StatelessWidget {
  final List<String> activityLevelList;
  final int currentIndex;
  final Function(int) onActivityLevelSelected;

  const ActivitySelector({
    super.key,
    required this.currentIndex,
    required this.onActivityLevelSelected,
    required this.activityLevelList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 60,
            diameterRatio: 1.5, // Reduce the curvature
            perspective: 0.002, // Adjust perspective for a flat look
            onSelectedItemChanged: (index) {
              onActivityLevelSelected(index);
            },
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index >= 0 && index < activityLevelList.length) {
                  return Center(
                    child: Text(
                      activityLevelList[index],
                      style: TextStyle(
                        fontSize: currentIndex == index ? 24 : 18,
                        fontWeight: currentIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color:
                            currentIndex == index ? Colors.white : Colors.grey,
                      ),
                    ),
                  );
                }
                return null;
              },
              childCount: activityLevelList.length,
            ),
          ),
        ),
      ],
    );
  }
}
