part of 'home_cubit.dart';

// Define sealed class HomeState which extends Equatable
// Sealed classes can only be extended within the same file.
sealed class HomeState extends Equatable {
  const HomeState(); // Constructor for HomeState

  @override
  List<Object> get props => []; // Equatable props getter to enable comparison
}

// HomeInitial state indicating the initial state of the home screen
final class HomeInitial extends HomeState {}

// GetUserDataLoading state indicating that user data is being fetched
final class GetUserDataLoading extends HomeState {}

// GetUserDataSuccess state indicating successful retrieval of user data
final class GetUserDataSuccess extends HomeState {
  final User userData; // User data retrieved successfully

  // Constructor for GetUserDataSuccess state with required userData parameter
  const GetUserDataSuccess({required this.userData});
}

// GetUserDataError state indicating an error occurred while fetching user data
final class GetUserDataError extends HomeState {
  final String error; // Error message describing the issue

  // Constructor for GetUserDataError state with required error parameter
  const GetUserDataError({required this.error});
}

final class GetClassfictionDataLoading extends HomeState {}

final class GetClassfictionDataSuccess extends HomeState {
  final ClassfictionModel classfictionData;
  const GetClassfictionDataSuccess({required this.classfictionData});
}

final class GetClassfictionDataError extends HomeState {
  final String error;
  const GetClassfictionDataError({required this.error});
}

final class ImageClassificationLoading extends HomeState {}

final class ImageClassificationSuccess extends HomeState {
  final ClassfictionModel classfictionData;

  const ImageClassificationSuccess({required this.classfictionData});
}

final class ImageClassificationError extends HomeState {
  final String error;

  const ImageClassificationError({required this.error});
}

//----------------------------------------------------------------
final class UploadImageFromGallerySuccessState extends HomeState {
  final XFile image;

  const UploadImageFromGallerySuccessState({required this.image});
}

final class UploadImageErrorState extends HomeState {
  final String errorMessage;

  const UploadImageErrorState({required this.errorMessage});
}

final class UploadImageFromCameraSucsessState extends HomeState {
  final XFile image;

  const UploadImageFromCameraSucsessState({required this.image});
}

final class UploadAndGetResponseToModelSucsesState extends HomeState {
  final ClassfictionModel classfictionModel;

  const UploadAndGetResponseToModelSucsesState(
      {required this.classfictionModel});
}

final class UploadAndGetResponseToModelLoadingState extends HomeState {}

final class UploadAndGetResponseToModelErrorState extends HomeState {
  final String errorMessage;

  const UploadAndGetResponseToModelErrorState({required this.errorMessage});
}
