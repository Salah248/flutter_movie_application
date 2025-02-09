import 'package:flutter/material.dart';
import 'package:flutter_movie_application/presentation/resources/app_colores.dart';

class SelectableOptions extends StatelessWidget {
  const SelectableOptions(
      {super.key,
      required this.title,
      required this.isSealcted,
      required this.onTap});

  final String title;
  final bool isSealcted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSealcted ? AppColors.primary : AppColors.secondBackground,
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
