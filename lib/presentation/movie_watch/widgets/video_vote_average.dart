import 'package:flutter/material.dart';

class VideoVoteAverage extends StatelessWidget {
  const VideoVoteAverage({super.key, required this.voteAverage});

  final double voteAverage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        Text(
          ' ${voteAverage.toStringAsFixed(1)}',
        ),
      ],
    );
  }
}
