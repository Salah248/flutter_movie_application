import 'package:flutter/material.dart';
import 'package:flutter_movie_application/presentation/resources/app_colores.dart';

class NoInternet extends StatelessWidget {
  final VoidCallback onRetry;
  final String text ;
  
  const NoInternet({super.key, required this.onRetry, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: AppColors.secondBackground, fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: Text(
              "Retry",
              style: TextStyle(color: AppColors.secondBackground, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}