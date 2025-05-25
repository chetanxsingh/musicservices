import 'package:flutter/material.dart';
import '../models/music_service.dart';

class ServiceDetailScreen extends StatelessWidget {
  final MusicService service;

  const ServiceDetailScreen({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service.icon, size: 64, color: Colors.blue),
            const SizedBox(height: 24),
            Text(
              'You tapped on: ${service.title}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                service.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}