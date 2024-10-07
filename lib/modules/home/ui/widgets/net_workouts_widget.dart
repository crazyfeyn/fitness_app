import 'package:flutter/material.dart';
import 'package:flutter_application/l10n/l10n.dart';

class NetWorkoutsWidget extends StatelessWidget {
  final String imageUrl;
  final String titleKey;
  final String subtitleKey;
  final int rangeNumber;

  const NetWorkoutsWidget({
    super.key,
    required this.imageUrl,
    required this.titleKey,
    required this.subtitleKey,
    required this.rangeNumber,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = Localizations.of(context, L10n);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/workoutScreen',
        arguments: {'rangeNumber': rangeNumber},
      ),
      child: Row(
        children: [
          Container(
            width: 200,
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/images/$imageUrl"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations?.translate(titleKey) ?? titleKey,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  localizations?.translate(subtitleKey) ?? subtitleKey,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffD0FD3E),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
