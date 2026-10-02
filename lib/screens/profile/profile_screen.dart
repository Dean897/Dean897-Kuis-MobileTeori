import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../data/profile_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profil', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 24),
          Center(
            child: CircleAvatar(
              radius: 64,
              backgroundColor: AppTheme.mint,
              backgroundImage: const AssetImage(ProfileData.photoAsset),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              ProfileData.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 26),
          Card(
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.badge_outlined,
                  label: 'NIM',
                  value: ProfileData.nim,
                ),
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Tempat, tanggal lahir',
                  value: '${ProfileData.birthplace}, ${ProfileData.birthDate}',
                ),
                _InfoRow(
                  icon: Icons.favorite_border,
                  label: 'Hobi',
                  value: ProfileData.hobby,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon, color: AppTheme.teal),
    title: Text(label, style: Theme.of(context).textTheme.bodyMedium),
    subtitle: Text(value, style: Theme.of(context).textTheme.titleMedium),
  );
}
