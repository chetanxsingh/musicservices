import 'package:flutter/material.dart';
import '../models/music_service.dart';

import 'music_service_repository.dart';

class MusicServiceViewModel with ChangeNotifier {
  final MusicServiceRepository repository;
  List<MusicService> _services = [];
  bool _isLoading = false;
  String _error = '';

  MusicServiceViewModel({required this.repository});

  List<MusicService> get services => _services;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();

    try {
      _services = await repository.getMusicServices();
      _error = '';
    } catch (e) {
      _error = e.toString();
      _services = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}