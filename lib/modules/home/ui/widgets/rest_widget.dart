import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import your localization class

class RestWidget extends StatefulWidget {
  final int remainingTime;
  final bool isRest;
  final VoidCallback onSkipRest;
  final void Function(int) onAddTime;

  const RestWidget({
    super.key,
    required this.remainingTime,
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
    _remainingTime = widget.remainingTime;
    _startTimer();
  }

  @override
  void didUpdateWidget(RestWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.remainingTime != oldWidget.remainingTime) {
      setState(() {
        _remainingTime = widget.remainingTime;
      });
    }
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
          title: Text(AppLocalizations.of(context)!.skip),
          content: Text(AppLocalizations.of(context)!.skipRestConfirmation),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _remainingTime = 0;
                });
                widget.onSkipRest();
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.skip),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Expanded(
      child: Column(
        children: [
          if (widget.isRest)
            Flexible(
              flex: 7,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Text(
                      localizations.restingTime,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Color(0xFF3375FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const CircleAvatar(
                        backgroundColor: Color(0xFF005FFF),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
          Flexible(
            flex: 22,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '00:${_remainingTime.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 48,
                      color: widget.isRest ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 130),
                  if (widget.isRest)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _remainingTime +=
                                  10; // Change to 10 seconds as per the localization
                            });
                            widget.onAddTime(10);
                          },
                          child: Container(
                            width: 250,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3375FF),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              '+10 ${localizations.seconds}', // Localized text for adding time
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _skipRest,
                          child: Container(
                            width: 250,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3375FF),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              localizations.skip, // Localized text for skipping
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
