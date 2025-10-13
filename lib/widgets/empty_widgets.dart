import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/colors_asset.dart';

class EmptyWidgets extends StatelessWidget {
  const EmptyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/Loading Animation.json'),
          Text("There is No Contacts Added Here",style: TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),)

        ],),
    );
  }
}
