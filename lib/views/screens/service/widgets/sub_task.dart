import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:codagetest/extentions/sizedbox_extention.dart';
import 'package:codagetest/views/themes/app_animations.dart';
import 'package:codagetest/views/themes/app_colors.dart';
import 'package:codagetest/views/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SubtaskWidget extends StatelessWidget {
  final String description;
  final String status;
  final String date;
  final double price;
  final bool isCompleted;

  const SubtaskWidget({
    super.key,
    required this.description,
    required this.status,
    required this.date,
    required this.price,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.pending,
            color: isCompleted ? AppColors.green : AppColors.orangeAccent,
          ),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w400)),
                5.height,
                Text(status, style: Theme.of(context).textTheme.bodySmall),
                5.height,
                Text(date, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          10.width,
          Column(
            children: [
              Text('\$$price',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w400)),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                            color: AppColors.purpleAccent,
                            width: 3,
                          ),
                        ),
                        backgroundColor: AppColors.white.withOpacity(0.9),
                        title: const Row(
                          children: [
                            Text(
                              'Subtask Image',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        content: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: CachedNetworkImage(
                            imageUrl: AppImages.onlineServiceImage,
                            placeholder: (context, url) => const SizedBox(
                              width: 200,
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.brightBlue,
                                  ),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Lottie.asset(
                    AppAnimations.eyeAnimation2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
