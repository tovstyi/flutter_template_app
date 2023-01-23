import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_product_card_details_page_state.dart';

class DestinationPageCubit extends Cubit<ViewProductCardDetailsState> {
  DestinationPageCubit() : super(ViewPhotoInitial());
}
// TODO: create view photo cubit transferring photo link function
