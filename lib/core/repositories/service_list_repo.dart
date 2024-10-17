import 'dart:convert'; // For JSON decoding
import 'package:codagetest/core/models/service_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ServiceRepo {
  final String baseURL = 'https://testapi.io/api/otmane/';
  final String servicepreview = 'servicepreview';

  // Method to fetch Service Previews for the homw screen
  Future<List<ServicePreview>> fetchServicePreviews() async {
    try {
      final response = await http.get(Uri.parse(baseURL + servicepreview));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        return ServicePreview.fromJsonList(jsonData['servicePreviews']);
      } else {
        throw Exception('Failed to load service previews');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      rethrow;
    }
  }

  // Method to fetch Service Detail from a given endpoint
  Future<ServiceModel> fetchServiceDetail(String endpoint) async {
    try {
      final response =
          await http.get(Uri.parse('$baseURL$servicepreview/$endpoint'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        return ServiceModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load service details');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching service details: $e');
      }
      rethrow;
    }
  }
}
