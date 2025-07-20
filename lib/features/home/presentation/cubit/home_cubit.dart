import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/data/remote_data/web_servcies.dart';
import 'package:food_app/features/home/presentation/cubit/home_state.dart';

class CategoryCubit extends Cubit<HomeState> {
  final WebServices webServices;

  CategoryCubit(this.webServices) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());

    try {
      final categories = await webServices.getCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
