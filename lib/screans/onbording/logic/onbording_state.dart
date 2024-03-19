part of 'onbording_cubit.dart';

// Define a sealed class for OnboardingState
@immutable
sealed class OnboardingState {}

// Define initial state for onboarding
final class OnboardingInitial extends OnboardingState {}

// Define state for page view index changed
final class PageViewIndexChangedState extends OnboardingState {}

// Define state for navigating between onboarding pages
final class NavigateBetweenPages extends OnboardingState {}

// Define state for skipping to sign-in or home screen
final class SkipToSignInOrHome extends OnboardingState {}
