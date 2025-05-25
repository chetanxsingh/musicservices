// lib/utils/firestore_seeder.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreSeeder {
  static Future<void> seedMusicServices() async {
    final firestore = FirebaseFirestore.instance;
    final collection = firestore.collection('music_services');

    // Check if data already exists
    final snapshot = await collection.get();
    if (snapshot.docs.isNotEmpty) {
      print('Data already exists, skipping seed');
      return;
    }

    final services = [
      {
        'title': 'Music Production',
        'description': 'Custom instruments & film scoring',
        'iconPath': 'music_production',
        'color': '#FF6B6B',
        'order': 1,
      },
      {
        'title': 'Mixing & Mastering',
        'description': 'Make your tracks Radio-ready',
        'iconPath': 'mixing_mastering',
        'color': '#4ECDC4',
        'order': 2,
      },
      {
        'title': 'Lyrics Writing',
        'description': 'Turn feelings into lyrics',
        'iconPath': 'lyrics_writing',
        'color': '#FFE66D',
        'order': 3,
      },
      {
        'title': 'Vocals',
        'description': 'Vocals that bring your lyrics to life',
        'iconPath': 'vocals',
        'color': '#B57EDC',
        'order': 4,
      },
    ];

    // Add each service
    for (var service in services) {
      await collection.add(service);
    }

    print('Successfully seeded music services data');
  }
}