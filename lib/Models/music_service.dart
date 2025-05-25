import 'package:flutter/material.dart';

class MusicService {
  final String id;
  final String title;
  final String description;
  final IconData icon;

  MusicService({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  factory MusicService.fromMap(String id, Map<String, dynamic> data) {
    // Map icon string to actual IconData
    IconData iconData;
    switch (data['icon']) {
      case 'music_note':
        iconData = Icons.music_note;
        break;
      case 'headphones':
        iconData = Icons.headphones;
        break;
      case 'mic':
        iconData = Icons.mic;
        break;
      case 'library_music':
        iconData = Icons.library_music;
        break;
      case 'equalizer':
        iconData = Icons.equalizer;
        break;
      case 'audiotrack':
        iconData = Icons.audiotrack;
        break;
      default:
        iconData = Icons.music_note;
    }

    return MusicService(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: iconData,
    );
  }
}