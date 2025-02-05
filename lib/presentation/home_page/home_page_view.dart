import 'package:flutter/material.dart';
import 'package:flutter_movie_application/common/widgets/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset('assets/vectors/logo.svg'),
        ),
        
      ),
    );
  }
}