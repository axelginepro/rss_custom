import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {

  final String imageUrl;

  const ImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: (imageUrl == "") ? Container() :  Image.network(
        imageUrl,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 4,
      ),
    );
  }
}
