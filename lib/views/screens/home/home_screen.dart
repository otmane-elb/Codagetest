import 'package:codagetest/core/utils/get_random_number.dart';
import 'package:codagetest/core/viewmodels/service_preview_view_model.dart';
import 'package:codagetest/views/screens/home/widgets/service_preview.dart';
import 'package:codagetest/views/screens/service/service_detail.dart';
import 'package:codagetest/views/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:codagetest/views/themes/app_icons.dart';

class ServicePreviewPage extends StatelessWidget {
  const ServicePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ServicePreviewViewModel controller =
        Get.put(ServicePreviewViewModel());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Services',
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppIcons.background,
              fit: BoxFit.cover,
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.brightBlue,
              ));
            }

            if (controller.servicePreviews.isEmpty) {
              return const Center(
                  child: Text(
                'No services found.',
                style: TextStyle(color: Colors.white),
              ));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: controller.servicePreviews.length,
              itemBuilder: (context, index) {
                final preview = controller.servicePreviews[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => ServiceDetailScreen(
                        endpoint: getrandomnumber(index + 1).toString()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ServicePreviewWidget(preview: preview),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
