import 'package:cached_network_image/cached_network_image.dart';
import 'package:codagetest/extentions/sizedbox_extention.dart';
import 'package:codagetest/views/themes/app_animations.dart';
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
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
            isCompleted ? Icons.check_circle : Icons.circle,
            color: isCompleted ? Colors.green : Colors.grey,
          ),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                5.height,
                Text(status),
                5.height,
                Text(date),
              ],
            ),
          ),
          10.width,
          Column(
            children: [
              Text('\$$price'),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Subtask Image'),
                      content: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: CachedNetworkImage(
                          imageUrl: AppImages.onlineServiceImage,
                          placeholder: (context, url) => const SizedBox(
                            width: 200,
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
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
