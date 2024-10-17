import 'package:codagetest/extentions/sizedbox_extention.dart';
import 'package:codagetest/views/themes/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GamifiedProgressBar extends StatelessWidget {
  final double milestoneProgress;

  const GamifiedProgressBar({
    super.key,
    required this.milestoneProgress,
  });
  // Determine text and color based on progress
  String _getProgressText() {
    if (milestoneProgress >= 1.0) {
      return 'Complete!';
    } else if (milestoneProgress >= 0.75) {
      return 'Almost There!';
    } else if (milestoneProgress >= 0.50) {
      return 'Halfway Done!';
    } else if (milestoneProgress >= 0.25) {
      return 'Getting Started!';
    } else {
      return 'Just Begun!';
    }
  }

  Color _getProgressColor() {
    if (milestoneProgress >= 1.0) {
      return Colors.greenAccent;
    } else if (milestoneProgress >= 0.75) {
      return Colors.orangeAccent;
    } else if (milestoneProgress >= 0.50) {
      return Colors.amber;
    } else if (milestoneProgress >= 0.25) {
      return Colors.blueAccent;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Milestone Progress Header
        const Text(
          'Milestone Progress',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent, // More colorful header
          ),
        ),
        10.height,
        // Gamified Progress Bar with Gradient
        Stack(
          children: [
            Container(
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: const LinearGradient(
                  colors: [
                    Colors.redAccent,
                    Colors.orangeAccent,
                    Colors.yellowAccent,
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: milestoneProgress,
                  child: Container(
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.greenAccent.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        10.height,
        Row(
          children: [
            Text(
              '${(milestoneProgress * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
            10.width,
            SizedBox(
              width: 50,
              height: 50,
              child: Lottie.asset(
                AppAnimations.trophyAnimation,
                fit: BoxFit.contain,
              ),
            ),
            5.width,
            Text(
              _getProgressText(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _getProgressColor(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
