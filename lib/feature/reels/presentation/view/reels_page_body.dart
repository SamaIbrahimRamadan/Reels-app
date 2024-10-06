import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/core/utils/api_server.dart';
import 'package:reels_viewer/reels_viewer.dart';
import '../../data/repo/reels_repo_imple.dart';
import '../manger/reels_cubit/reels_cubit.dart';

class ReelsPageBody extends StatelessWidget {
  const ReelsPageBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ReelsCubit(  ReelsRepoImpl(ApiService(Dio())))
        ..getReels(),
      child: BlocBuilder<ReelsCubit, ReelsState>(

        builder: (context, state) {
          if (state is ReelsSuccess) {
            List <ReelModel>reelsList=[];
            List reels =state.reels;
            for ( int i =0 ; i <reels.length; i++){
              reelsList.add(
                ReelModel(reels[i].video??'','' ,  likeCount: reels[i].likesCount??0,
                  isLiked: reels[i].authLikeStatus?? true,
                  id: reels[i].id!.toString(),

              ));
            }
            
            return ReelsViewer(

              reelsList: reelsList,
              appbarTitle: 'Instagram Reels',
              onShare: (url) {
                log('Shared reel url ==> $url');
              },
              onLike: (url) {
                log('Liked reel url ==> $url');
              },
              onFollow: () {
                log('======> Clicked on follow <======');
              },
              onComment: (comment) {
                log('Comment on reel ==> $comment');
              },
              onClickMoreBtn: () {
                log('======> Clicked on more option <======');
              },
              onClickBackArrow: () {
                log('======> Clicked on back arrow <======');
              },
              onIndexChanged: (index) {
                log('======> Current Index ======> $index <========');
              },
              showProgressIndicator: true,
              showVerifiedTick: true,
              showAppbar: true,

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