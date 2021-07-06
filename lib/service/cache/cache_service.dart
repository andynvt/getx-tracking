import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

CacheService get cacheSrv => CacheService.shared();

class CacheService {
  static CacheService? _sInstance;
  static Box? _box;

  CacheService._();

  factory CacheService.shared() {
    if (_sInstance == null) {
      _sInstance = CacheService._();
    }
    return _sInstance!;
  }

  static init() async {
    if (!kIsWeb) {
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      Hive..init(appDocDirectory.path);
    }
    _box = await Hive.openBox('cache');
  }

  String get accessToken => _box!.get('accessToken', defaultValue: '');
  set accessToken(String? token) => _box!.put('accessToken', token ?? '');
}
