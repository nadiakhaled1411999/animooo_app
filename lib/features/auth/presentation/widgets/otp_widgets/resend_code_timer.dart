import 'dart:async';

import 'package:animooo_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

/// Reusable "Resend Code" countdown.
///
/// Shows "Resend Code In mm:ss" while counting down and becomes a tappable
/// "Resend Code" link (primary color) when it reaches 00:00.
class ResendCodeTimer extends StatefulWidget {
  const ResendCodeTimer({super.key, this.onResend});

  final VoidCallback? onResend;

  @override
  State<ResendCodeTimer> createState() => _ResendCodeTimerState();
}

class _ResendCodeTimerState extends State<ResendCodeTimer> {
  static const int _startSeconds = 59;

  Timer? _timer;
  int _secondsLeft = _startSeconds;

  bool get _isCounting => _secondsLeft > 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onTick(Timer timer) {
    if (_secondsLeft <= 1) {
      timer.cancel();
      setState(() => _secondsLeft = 0);
    } else {
      setState(() => _secondsLeft--);
    }
  }

  void _restart() {
    _timer?.cancel();
    setState(() => _secondsLeft = _startSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  String get _formattedTime {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isCounting
          ? null
          : () {
              widget.onResend?.call();
              _restart();
            },
      child: Text(
        _isCounting ? 'Resend Code In $_formattedTime' : 'Resend Code',
        style: _isCounting
            ? AppTextStyles.font12RegularTextSecondary
            : AppTextStyles.font12MediumPrimary,
        textAlign: TextAlign.center,
      ),
    );
  }
}
