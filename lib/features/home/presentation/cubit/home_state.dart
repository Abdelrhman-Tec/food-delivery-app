sealed class HomeState {}

final class HomeIntial extends HomeState {}

class CategoryInitial extends HomeState {}

class CategoryLoading extends HomeState {}

class CategoryLoaded extends HomeState {
  final List<String> categories;

  CategoryLoaded(this.categories);
}

class CategoryError extends HomeState {
  final String message;

  CategoryError(this.message);
}
