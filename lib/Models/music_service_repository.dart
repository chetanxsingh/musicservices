import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/music_service.dart';

class MusicServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MusicService>> getMusicServices() async {
    try {
      final querySnapshot = await _firestore.collection('music_services').get();
      return querySnapshot.docs.map((doc) {
        return MusicService.fromMap(doc.id, doc.data());
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch music services: $e');
    }
  }
}