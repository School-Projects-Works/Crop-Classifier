// Define a class representing an onboarding page
class OnboardingModel {
  // Title of the onboarding page
  final String title;

  // Optional image path for the onboarding page
  final String? imagePath;

  // Subtitle of the onboarding page
  final String subtitle;

  // Constructor for OnboardingModel class with required title and subtitle parameters,
  // and an optional imagePath parameter
  OnboardingModel({
    required this.title,
    this.imagePath,
    required this.subtitle,
  });
}
