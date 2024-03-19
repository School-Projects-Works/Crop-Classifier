class User {
  Dataa? data; // User data
  String? message; // Message related to user data
  bool? status; // Status of user data retrieval

  // Constructor for User class with optional parameters
  User({this.data, this.message, this.status});

  // Constructor to create User object from JSON data
  User.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      // Check if 'data' key exists in JSON
      // If exists, create Data object from JSON data, otherwise set it to null
      data = json['data'] != null ? Dataa.fromJson(json['data']) : null;
      message = json['message']; // Get message from JSON
      status = json['status']; // Get status from JSON
    }
  }
}

// Class representing additional data associated with a user
class Dataa {
  String? city; // User's city
  String? email; // User's email
  String? fullName; // User's full name
  String? phoneNumber; // User's phone number

  // Constructor for Data class with optional parameters
  Dataa({this.city, this.email, this.fullName, this.phoneNumber});

  // Constructor to create Data object from JSON data
  Dataa.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      city = json['city']; // Get city from JSON
      email = json['email']; // Get email from JSON
      fullName = json['fullName']; // Get full name from JSON
      phoneNumber = json['phoneNumber']; // Get phone number from JSON
    }
  }
}
