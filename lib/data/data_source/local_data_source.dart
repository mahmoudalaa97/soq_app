// ignore_for_file: constant_identifier_names

import 'package:soq_app/data/network/error_handeler.dart';

import '../responses/responses.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 50000;

abstract class LocalDataSource {
  Future<HomeResponse> getHomedata();
  Future<void> saveHomeToCache(HomeResponse homeResponse);

  void clearCache();
  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  Map<String, CachedItem> cacheMap = {};
  @override
  Future<HomeResponse> getHomedata() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];

    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      //return home data that saved
      return cachedItem.data;
    } else {
      //return error
      throw ErrorHandeler.handel(DataSource.CASHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cacheMap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  int cachedTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTimeInMillis - cachedTime <= expirationTimeInMillis;
    return isValid;
  }
}
