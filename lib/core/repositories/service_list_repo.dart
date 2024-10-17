import 'dart:convert'; // For JSON decoding
import 'package:codagetest/core/models/service_model.dart';
import 'package:http/http.dart' as http;

class ServiceListRepo {
  final String baseURL = 'https://testapi.io/api/otmane/';
  final String servicepreview = 'servicepreview';

  // Method to fetch Service Previews
  Future<List<ServicePreview>> getServicePreviews() async {
    try {
      final response = await http.get(Uri.parse(baseURL + servicepreview));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        return ServicePreview.fromJsonList(jsonData['servicePreviews']);
      } else {
        throw Exception('Failed to load service previews');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  // Method to fetch Service Detail from a given endpoint
  Future<ServiceModel> fetchServiceDetail(String endpoint) async {
    try {
      final response =
          await http.get(Uri.parse('$baseURL$servicepreview/$endpoint'));

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        return ServiceModel.fromJson(
            jsonData); // Return the fetched ServiceModel
      } else {
        throw Exception('Failed to load service details');
      }
    } catch (e) {
      print('Error fetching service details: $e');
      throw e;
    }
  }
}
