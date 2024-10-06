
import 'package:flutter/material.dart';

import 'package:reels/feature/reels/presentation/view/reels_page_body.dart';

class ReelsPage extends StatelessWidget{
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ReelsPageBody(),
    );
  }

}