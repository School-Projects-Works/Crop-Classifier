// Class representing a user model
class UserModel {
  Data? data; // User data
  String? message; // Message related to user
  bool? status; // Status of user

  // Constructor for UserModel class with optional parameters
  UserModel({this.data, this.message, this.status});

  // Convert UserModel object to JSON format
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson(); // Convert Data object to JSON
    }
    data['message'] = message; // Add message to JSON
    data['status'] = status; // Add status to JSON
    return data;
  }

  // Constructor to create UserModel object from JSON data
  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? Data.fromJson(json['data'])
        : null; // Create Data object from JSON
    message = json['message']; // Get message from JSON
    status = json['status']; // Get status from JSON
  }
}

// Class representing additional data associated with a user
class Data {
  int? id; // User ID
  String? city; // User's city
  String? email; // User's email
  String? fullName; // User's full name
  String? phoneNumber; // User's phone number
  String? token; // User's authentication token
  String? profilePic; // URL to user's profile picture

  // Constructor for Data class with optional parameters
  Data({
    this.city,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.token,
    this.id,
    this.profilePic,
  });

  // Convert Data object to JSON format
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['city'] = city; // Add city to JSON
    data['email'] = email; // Add email to JSON
    data['fullName'] = fullName; // Add full name to JSON
    data['phoneNumber'] = phoneNumber; // Add phone number to JSON
    data['token'] = token; // Add token to JSON
    data['id'] = id; // Add ID to JSON
    data['profilePic'] = profilePic; // Add profile picture URL to JSON

    return data;
  }

  // Constructor to create Data object from JSON data
  Data.fromJson(Map<String, dynamic> json) {
    city = json['city']; // Get city from JSON
    email = json['email']; // Get email from JSON
    fullName = json['fullName']; // Get full name from JSON
    phoneNumber = json['phoneNumber']; // Get phone number from JSON
    token = json['token']; // Get token from JSON
    id = json['id']; // Get ID from JSON
  }
}
