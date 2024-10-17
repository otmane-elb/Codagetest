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

  static List<ServiceModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ServiceModel.fromJson(json)).toList();
  }

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

  factory SubtaskModel.fromJson(Map<String, dynamic> json) {
    return SubtaskModel(
      description: json['description'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      isCompleted: json['isCompleted'] as bool?,
    );
  }

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

class ServicePreview {
  final String? serviceName;
  final double? totalPrice;
  final double? milestoneProgress;

  ServicePreview({
    this.serviceName,
    this.totalPrice,
    this.milestoneProgress,
  });

  factory ServicePreview.fromJson(Map<String, dynamic> json) {
    return ServicePreview(
      serviceName: json['serviceName'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      milestoneProgress: (json['milestoneProgress'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'totalPrice': totalPrice,
      'milestoneProgress': milestoneProgress,
    };
  }

  static List<ServicePreview> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ServicePreview.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<ServicePreview> previews) {
    return previews.map((preview) => preview.toJson()).toList();
  }
}
