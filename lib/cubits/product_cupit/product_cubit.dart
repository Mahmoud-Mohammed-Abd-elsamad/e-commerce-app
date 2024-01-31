import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../helper/dio_helper.dart';
import '../../helper/http_hlper.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  //DioHelper dio = DioHelper();
  var prodctsList = [];

  getproducts() async {
    emit(ProductLoadingState());
    try {
      final response = await ApiManger.getData();
      prodctsList = response.data!.dataM!;

      emit(ProductSuccessState());
    } catch (e) {
      emit(ProductFauler());
    }
  }
}
