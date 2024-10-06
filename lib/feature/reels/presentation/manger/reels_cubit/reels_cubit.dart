
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/feature/reels/data/models/get_reels_model.dart';

import '../../../data/repo/reels_repo.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit(this.reelsRepo,) : super(ReelsInitial());
  final ReelsRepo reelsRepo;
  Future<void> getReels() async {
    emit(ReelsLoading());
    var result = await reelsRepo.showReels();
    result.fold((failure) {
      emit(ReelsFailure(failure.errMessage));
    }, (reels) {
      emit(ReelsSuccess(reels));
    });

  }
}
