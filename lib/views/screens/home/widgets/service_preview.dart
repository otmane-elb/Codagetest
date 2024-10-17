import 'package:codagetest/core/models/service_model.dart';
import 'package:codagetest/extentions/sizedbox_extention.dart';
import 'package:flutter/material.dart';

class ServicePreviewWidget extends StatelessWidget {
  final ServicePreview preview;

  const ServicePreviewWidget({super.key, required this.preview});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(preview.serviceName ?? '',
              style: Theme.of(context).textTheme.titleMedium),
          10.height,
          Text('Total Price: \$${preview.totalPrice?.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleSmall),
          10.height,
          Text('Progress: ${preview.milestoneProgress?.toStringAsFixed(0)}%',
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
