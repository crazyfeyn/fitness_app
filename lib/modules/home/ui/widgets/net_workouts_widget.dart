import 'package:flutter/material.dart';

class NetWorkoutsWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int rangeNumber;
  const NetWorkoutsWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.rangeNumber});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/workoutScreen',
          arguments: {'rangeNumber': rangeNumber}),
      child: Row(
        children: [
          Container(
            width: 200,
            height: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/images/$imageUrl"),
                    fit: BoxFit.cover)),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffD0FD3E)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
