import 'package:reels/feature/reels/data/models/get_reels_model.dart';

import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
abstract class ReelsRepo {

  Future<Either<Failure, List<DataModel>>> showReels();

}