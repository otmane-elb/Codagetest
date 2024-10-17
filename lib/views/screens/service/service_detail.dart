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

    // Fetch service detail when the screen is initialized
    controller.fetchServiceDetail(endpoint);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Service summary',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.green,
          ));
        }

        if (controller.serviceDetail.value == null) {
          return const Center(
              child: Text('Error while loading. Please try again later.'));
        }

        final service = controller.serviceDetail.value!;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    service.serviceName ?? "",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                10.height,
                Text(
                    'Service Description: ${service.serviceDescription ?? ""}'),
                10.height,
                Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Image.asset(AppIcons.personIcon), // Seller icon
                      ),
                      10.width,
                      Text(
                        'Seller: ${service.sellerName ?? ""}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                10.height,
                Text('Contract Details: ${service.contractDetails ?? ""}'),
                10.height,
                Text(
                  'Total Price: \$${service.totalPrice?.toStringAsFixed(2) ?? "0.00"}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                10.height,
                GamifiedProgressBar(
                    milestoneProgress:
                        (service.milestoneProgress ?? 0.0) / 100),
                15.height,
                const Divider(),
                Text(
                  'Sub-services:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                10.height,
                // Subtasks section
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
              ],
            ),
          ),
        );
      }),
    );
  }
}
