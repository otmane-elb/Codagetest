import 'package:codagetest/core/utils/get_random_number.dart';
import 'package:codagetest/core/viewmodels/service_preview_view_model.dart';
import 'package:codagetest/views/screens/home/widgets/service_preview.dart';
import 'package:codagetest/views/screens/service/service_detail.dart';
import 'package:codagetest/views/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePreviewPage extends StatelessWidget {
  const ServicePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ServicePreviewViewModel controller =
        Get.put(ServicePreviewViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.brightBlue,
          ));
        }

        if (controller.servicePreviews.isEmpty) {
          return const Center(child: Text('No services found.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: controller.servicePreviews.length,
          itemBuilder: (context, index) {
            final preview = controller.servicePreviews[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => ServiceDetailScreen(
                        endpoint: getrandomnumber(index + 1).toString()));
                  },
                  child: ServicePreviewWidget(preview: preview)),
            );
          },
        );
      }),
    );
  }
}
