import 'package:codagetest/core/repositories/service_list_repo.dart';
import 'package:get/get.dart';
import 'package:codagetest/core/models/service_model.dart';

class ServiceDetailViewModel extends GetxController {
  final ServiceListRepo _serviceListRepo = ServiceListRepo();

  var serviceDetail = Rxn<ServiceModel>(); // Observable that allows null values
  var isLoading = true.obs; // Observable for loading state

  // Function to fetch service details from API
  Future<void> fetchServiceDetail(String endpoint) async {
    try {
      isLoading(true); // Set loading to true
      ServiceModel fetchedServiceDetail =
          await _serviceListRepo.fetchServiceDetail(endpoint);
      serviceDetail.value = fetchedServiceDetail; // Update the service detail
    } catch (e) {
      print('Error fetching service detail: $e');
      serviceDetail.value = null; // Set to null if there’s an error
    } finally {
      isLoading(false); // Set loading to false after fetching
    }
  }
}
