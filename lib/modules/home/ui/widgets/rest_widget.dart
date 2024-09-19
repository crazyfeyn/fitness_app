import 'dart:async';
import 'package:flutter/material.dart';

class RestWidget extends StatefulWidget {
  final int initialRemainingTime;
  final bool isRest;
  final VoidCallback onSkipRest;
  final void Function(int) onAddTime;

  const RestWidget({
    super.key,
    required this.initialRemainingTime,
    required this.isRest,
    required this.onSkipRest,
    required this.onAddTime,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RestWidgetState createState() => _RestWidgetState();
}

class _RestWidgetState extends State<RestWidget> {
  late int _remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.initialRemainingTime;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
          widget.onSkipRest();
        }
      });
    });
  }

  void _skipRest() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Skip Rest?'),
          content: const Text('Are you sure you want to skip the rest period?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _remainingTime = 0;
                });
                widget.onSkipRest();
                Navigator.of(context).pop();
              },
              child: const Text('Skip'),
            ),
          ],
        );
      },
    );
  }

  @override
  void didUpdateWidget(RestWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialRemainingTime != oldWidget.initialRemainingTime) {
      setState(() {
        _remainingTime = widget.initialRemainingTime;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isRest)
          const Text(
            'REST',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        Text(
          '00:${_remainingTime.toString().padLeft(2, '0')}',
          style: const TextStyle(
            fontSize: 48,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        if (widget.isRest)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.onAddTime(20);
                },
                child: const Text('+20s'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _skipRest,
                child: const Text('SKIP'),
              ),
            ],
          ),
      ],
    );
  }
}
