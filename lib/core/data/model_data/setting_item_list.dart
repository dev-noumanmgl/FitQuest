import 'package:fitquest/core/data/models/setting_item_model.dart';
import 'package:flutter/material.dart';

List<SettingItemModel> settingItems = [
  SettingItemModel(
    icon: Icons.person_outline,
    title: 'Account',
    subtitle: 'Manage your profile and info',
    onTap: () {},
  ),
  SettingItemModel(
    icon: Icons.notifications_none,
    title: 'Notifications',
    subtitle: 'Customize notification preferences',
    onTap: () {},
  ),
  SettingItemModel(
    icon: Icons.lock_outline,
    title: 'Privacy',
    subtitle: 'Security & privacy options',
    onTap: () {},
  ),
  SettingItemModel(
    icon: Icons.color_lens_outlined,
    title: 'Theme',
    subtitle: 'Choose app appearance',
    onTap: () {},
  ),
  SettingItemModel(
    icon: Icons.info_outline,
    title: 'About App',
    subtitle: 'Version, developer, license info',
    onTap: () {},
  ),
  SettingItemModel(
    icon: Icons.logout,
    title: 'Log Out',
    subtitle: 'Sign out of your account',
    onTap: () {},
  ),
];
