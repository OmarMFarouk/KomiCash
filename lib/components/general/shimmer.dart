import 'package:flutter/material.dart';
import 'package:h3m_shimmer_card/h3m_shimmer_card.dart';

import '../../src/app_color.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ShimmerCard(
      beginAlignment: Alignment.topLeft,
      endAlignment: Alignment.bottomRight,
      backgroundColor: AppColor.secondary,
      shimmerColor: AppColor.primary,
    );
  }
}
