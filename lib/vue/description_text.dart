import 'package:flutter/material.dart';

class DescriptionText extends Text {

  final String description;

  const DescriptionText({super.key, required this.description}): super(
  description,
  style: const TextStyle(color : Colors.blueGrey));
}
