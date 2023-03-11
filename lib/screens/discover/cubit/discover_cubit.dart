import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jaho_challenge/model/user_response.dart';
import 'package:jaho_challenge/repository/user_repository.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final UserRepository userRepo;
  DiscoverCubit({required this.userRepo}) : super(const DiscoverState());

  void switchView() {
    final isGridView = state.isGridView;
    emit(state.copyWith(
      isGridView: !isGridView,
    ));
  }

  Future<void> fetchUserData() async {
    EasyLoading.show(status: 'Loading...');

    final page = state.page;
    final res = await userRepo.getUserData(page);
    res.fold((e) {
      EasyLoading.showError('Loading user data failure, please try again!');
    }, (userResponse) {
      if (page <= userResponse.totalPages!) {
        final userData = state.userData ?? [];
        userData.addAll(userResponse.data ?? []);

        emit(state.copyWith(
          userData: userData,
          page: page + 1,
        ));
        EasyLoading.dismiss();
      } else {
        EasyLoading.showInfo('You have seen it all!');
      }
    });
  }
}
