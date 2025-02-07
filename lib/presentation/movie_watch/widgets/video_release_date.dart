import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  const VideoReleaseDate({super.key, required this.releaseDate});

final DateTime releaseDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_today,color: Colors.grey,),
        SizedBox(width: 8),
        Text(
          releaseDate.toString().split(' ')[0],
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}