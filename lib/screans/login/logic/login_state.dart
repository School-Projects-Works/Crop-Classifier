part of 'login_cubit.dart';

// Define a sealed class for LoginState
sealed class LoginState {}

// Define initial state for login
final class LoginInitial extends LoginState {}

// Define state for successful login
final class LoginSuccess extends LoginState {
  final UserModel loginModel; // User model containing login details

  // Constructor for LoginSuccess state with required loginModel parameter
  LoginSuccess({required this.loginModel});
}

// Define state for loading during login process
final class LoginLoading extends LoginState {}

// Define state for error occurred during login
final class LoginError extends LoginState {
  final String error; // Error message describing the issue

  // Constructor for LoginError state with required error parameter
  LoginError({required this.error});
}

// Define state for changing password visibility in the login form
final class LoginChangePasswordVisibility extends LoginState {}
