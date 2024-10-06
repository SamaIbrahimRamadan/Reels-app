import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:reels/core/error/failures.dart';
import 'package:reels/feature/reels/data/models/get_reels_model.dart';
import 'package:reels/feature/reels/data/repo/reels_repo.dart';

import '../../../../core/utils/api_server.dart';

class ReelsRepoImpl implements ReelsRepo {
  final ApiService apiService;

  ReelsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<DataModel>>> showReels() async{
    try {
      var dataJson = await apiService.get();
      List<DataModel> reels = [];
      for (var data in dataJson['data']) {
          reels.add(DataModel.fromJson(data));
      }

      return right(reels);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }return left(
        ServerFailure(
          e.toString(),
        ),
      );

  }}}