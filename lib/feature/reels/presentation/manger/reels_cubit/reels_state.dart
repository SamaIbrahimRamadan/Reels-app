part of 'reels_cubit.dart';

sealed class ReelsState {}

 class ReelsInitial extends ReelsState {}

class ReelsFailure extends ReelsInitial{
  final String error;
  ReelsFailure( this.error);
}
class ReelsLoading extends ReelsInitial{}
class ReelsSuccess extends ReelsInitial{
  final List<DataModel> reels;
  ReelsSuccess(this.reels);
}

