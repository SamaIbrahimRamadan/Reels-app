import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/feature/reels/presentation/view/widget/reels_widget.dart';

import '../../../../core/utils/api_server.dart';
import '../../data/repo/reels_repo_imple.dart';
import '../manger/reels_cubit/reels_cubit.dart';

class ReelsScreenBody extends StatelessWidget {
  const ReelsScreenBody({super.key});



  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (context) =>
      ReelsCubit(  ReelsRepoImpl(ApiService(Dio())))
        ..getReels(),
      child: BlocBuilder<ReelsCubit, ReelsState>(

        builder: (context, state) {
          if (state is ReelsSuccess) {

            List reels =state.reels;

            return  PageView.builder(
              itemCount: reels.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return VideoWidget (url: reels[index].video??'');
              },
            );
          } else if (state is ReelsFailure) {
            return Text(state.error);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },

      ),
    );

  }
}