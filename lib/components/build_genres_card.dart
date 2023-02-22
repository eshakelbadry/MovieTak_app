import 'package:flutter/material.dart';

class BuildGenresCard extends StatelessWidget {
  const BuildGenresCard({super.key, required this.genre});
  final String genre;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          genre,
          style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
