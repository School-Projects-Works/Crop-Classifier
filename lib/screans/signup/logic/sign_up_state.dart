part of 'sign_up_cubit.dart';

// Define sealed class for SignUpState extending Equatable
sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

// Define initial state for sign-up
final class SignUpInitial extends SignUpState {}

// Define state for successful sign-up
final class SignUpSuccess extends SignUpState {
  final UserModel registerModel; // User model containing sign-up details

  // Constructor for SignUpSuccess state with required registerModel parameter
  const SignUpSuccess({required this.registerModel});
}

// Define state for loading during sign-up process
final class SignUpLoading extends SignUpState {}

// Define state for error occurred during sign-up
final class SignUpError extends SignUpState {
  final String errorMessage; // Error message describing the issue

  // Constructor for SignUpError state with required errorMessage parameter
  const SignUpError({required this.errorMessage});
}

// Define state for changing password visibility in the sign-up form
final class SignUpChangePasswordVisibility extends SignUpState {}
