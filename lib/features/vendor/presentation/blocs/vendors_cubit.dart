import 'package:business_tracker/features/vendor/domain/entities/vendors_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorsCubit extends Cubit<List<Vendor>> {
  VendorsCubit(super.initialState);

  int currentPage = 1;
  bool isLastPage = false;
  bool isLoading = false;
}
