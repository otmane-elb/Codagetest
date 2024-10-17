import 'package:codagetest/core/repositories/service_list_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:codagetest/core/models/service_model.dart';

class ServiceDetailViewModel extends GetxController {
  final ServiceRepo _serviceListRepo = ServiceRepo();

  var serviceDetail = Rxn<ServiceModel>();
  var isLoading = true.obs;

  Future<void> fetchServiceDetail(String endpoint) async {
    try {
      ServiceModel fetchedServiceDetail =
          await _serviceListRepo.fetchServiceDetail(endpoint);
      serviceDetail.value = fetchedServiceDetail;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching service detail: $e');
      }
      serviceDetail.value = null;
    } finally {
      isLoading(false);
    }
  }
}
