class GenericMessageResponse {
  String? error;
  String? message;
  String? errorDescription;

  GenericMessageResponse({
    this.error,
    this.message,
    this.errorDescription,
  });

  GenericMessageResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    errorDescription = json['error_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['error_description'] = this.errorDescription;
    return data;
  }
}

class ErrorMessageResponse {
  String? error;
  String? message;
  String? errorDescription;
  Map<String, List<String>>? errors;

  ErrorMessageResponse({
    required this.error,
    required this.message,
    required this.errorDescription,
    required this.errors,
  });

  ErrorMessageResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    errorDescription = json['error_description'];
    if (json['errors'] != null) {
      errors = (json['errors'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['error_description'] = this.errorDescription;
    data['errors'] = this.errors;
    return data;
  }
}
