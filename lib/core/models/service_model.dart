class ServiceModel {
  final String? serviceName;
  final String? serviceDescription;
  final String? sellerName;
  final String? sellerIcon;
  final double? totalPrice;
  final double? milestoneProgress;
  final List<SubtaskModel>? subtasks;
  final String? contractDetails;

  ServiceModel({
    this.serviceName,
    this.serviceDescription,
    this.sellerName,
    this.sellerIcon,
    this.totalPrice,
    this.milestoneProgress,
    this.subtasks,
    this.contractDetails,
  });

  // Factory method to create a ServiceModel from JSON
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      serviceName: json['serviceName'] as String?,
      serviceDescription: json['serviceDescription'] as String?,
      sellerName: json['sellerName'] as String?,
      sellerIcon: json['sellerIcon'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      milestoneProgress: (json['milestoneProgress'] as num?)?.toDouble(),
      contractDetails: json['contractDetails'] as String?,
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((taskJson) => SubtaskModel.fromJson(taskJson))
          .toList(),
    );
  }

  // Method to convert a ServiceModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'sellerName': sellerName,
      'sellerIcon': sellerIcon,
      'totalPrice': totalPrice,
      'milestoneProgress': milestoneProgress,
      'contractDetails': contractDetails,
      'subtasks': subtasks?.map((task) => task.toJson()).toList(),
    };
  }

  // Factory method to create a List of ServiceModel from JSON
  static List<ServiceModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ServiceModel.fromJson(json)).toList();
  }

  // Method to convert a List of ServiceModel to JSON
  static List<Map<String, dynamic>> toJsonList(List<ServiceModel> services) {
    return services.map((service) => service.toJson()).toList();
  }
}

class SubtaskModel {
  final String? description;
  final String? status;
  final String? date;
  final double? price;
  final bool? isCompleted;

  SubtaskModel({
    this.description,
    this.status,
    this.date,
    this.price,
    this.isCompleted,
  });

  // Factory method to create a SubtaskModel from JSON
  factory SubtaskModel.fromJson(Map<String, dynamic> json) {
    return SubtaskModel(
      description: json['description'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      isCompleted: json['isCompleted'] as bool?,
    );
  }

  // Method to convert a SubtaskModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'status': status,
      'date': date,
      'price': price,
      'isCompleted': isCompleted,
    };
  }
}

// ServicePreview Model
class ServicePreview {
  final String? serviceName;
  final double? totalPrice;
  final double? milestoneProgress;

  ServicePreview({
    this.serviceName,
    this.totalPrice,
    this.milestoneProgress,
  });

  // Factory method to create a ServicePreview from JSON
  factory ServicePreview.fromJson(Map<String, dynamic> json) {
    return ServicePreview(
      serviceName: json['serviceName'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      milestoneProgress: (json['milestoneProgress'] as num?)?.toDouble(),
    );
  }

  // Method to convert a ServicePreview to JSON
  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'totalPrice': totalPrice,
      'milestoneProgress': milestoneProgress,
    };
  }

  // Factory method to create a List of ServicePreview from JSON
  static List<ServicePreview> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ServicePreview.fromJson(json)).toList();
  }

  // Method to convert a List of ServicePreview to JSON
  static List<Map<String, dynamic>> toJsonList(List<ServicePreview> previews) {
    return previews.map((preview) => preview.toJson()).toList();
  }
}
