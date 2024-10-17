import 'package:codagetest/core/models/service_model.dart';
import 'package:codagetest/core/repositories/service_list_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ServicePreviewViewModel extends GetxController {
  var servicePreviews = <ServicePreview>[].obs;
  var isLoading = true.obs;

  final ServiceRepo _serviceListRepo = ServiceRepo();

  @override
  void onInit() {
    super.onInit();
    fetchServicePreviews();
  }

  void fetchServicePreviews() async {
    try {
      isLoading(true);
      var previews = await _serviceListRepo.fetchServicePreviews();
      if (previews.isNotEmpty) {
        servicePreviews.value = previews;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
