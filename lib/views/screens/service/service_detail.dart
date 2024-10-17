import 'package:codagetest/extentions/sizedbox_extention.dart';
import 'package:get/get.dart';
import 'package:codagetest/views/screens/service/widgets/custom_progress_bar.dart';
import 'package:codagetest/views/screens/service/widgets/sub_task.dart';
import 'package:codagetest/views/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:codagetest/core/viewmodels/service_detail_view_model.dart';
import 'package:codagetest/views/themes/app_icons.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String endpoint;

  const ServiceDetailScreen({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    final ServiceDetailViewModel controller = Get.put(ServiceDetailViewModel());

    controller.fetchServiceDetail(endpoint);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Service summary',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background image
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
                ),
              );
            }

            if (controller.serviceDetail.value == null) {
              return const Center(
                child: Text(
                  'Error while loading. Please try again later.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            final service = controller.serviceDetail.value!;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    80.height,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        service.serviceName ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    10.height,
                    Stack(
                      children: [
                        GamifiedProgressBar(
                          milestoneProgress:
                              (service.milestoneProgress ?? 0.0) / 100,
                        ),
                        Positioned(
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                                'Level ${((service.milestoneProgress ?? 0) ~/ 25) + 1}',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                      ],
                    ),
                    10.height,
                    Text(
                      service.serviceDescription ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.white),
                    ),
                    20.height,
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white70,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset(AppIcons.personIcon),
                          ),
                          10.width,
                          Text(
                            'Seller: ${service.sellerName ?? ""}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    10.height,
                    Text(
                      'Contract Details: ${service.contractDetails ?? ""}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.white),
                    ),
                    20.height,
                    const Divider(
                      color: AppColors.white,
                    ),
                    Text(
                      'Sub-services:',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    10.height,
                    ...?service.subtasks?.map((subtask) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: SubtaskWidget(
                          description: subtask.description ?? "",
                          status: subtask.status ?? "",
                          date: subtask.date ?? "",
                          price: subtask.price ?? 0,
                          isCompleted: subtask.isCompleted ?? false,
                        ),
                      );
                    }),
                    20.height,
                    // Reward Button
                    Center(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                        onPressed: () {
                          Get.snackbar("Reward Collected!",
                              "You've earned 50 points for completing the service!",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.yellow,
                              colorText: AppColors.black);
                        },
                        icon: const Icon(Icons.star, color: AppColors.yellow),
                        label: Text(
                          'Claim Reward',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
