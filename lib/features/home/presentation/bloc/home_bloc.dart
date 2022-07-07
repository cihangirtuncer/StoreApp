import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/core/constants/api_constants.dart';
import 'package:store_app/features/home/data/model/product_model.dart';
import 'package:store_app/features/home/data/datasources/home_datasources.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final homeService =
      HomeService(Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)));

  HomeBloc() : super(HomeLoading()) {
    on<LoadProducts>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    List<Products>? products = await homeService.fetchUsers();

    if (products == null) {
      emit(HomeFailed());
      return;
    }

    emit(HomeLoaded(products: products));
  }
}
