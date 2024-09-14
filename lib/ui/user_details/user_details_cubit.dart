import 'package:architecture/ui/user_details/user_details_initial_params.dart';
import 'package:architecture/ui/user_details/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsState.initial());

  void onInit({required UserDetailsInitialParam initialParams}) {
    emit(state.copyWith(user: initialParams.user));
  }
}
