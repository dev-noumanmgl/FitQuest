import 'package:flutter/material.dart';

class SettingItemModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  SettingItemModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}
