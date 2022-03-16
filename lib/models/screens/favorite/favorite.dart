import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_shop/models/screens/favorite/components/body.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FavoriteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
