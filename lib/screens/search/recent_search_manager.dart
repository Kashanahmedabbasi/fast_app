import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchesManager {
  static const _keyRecentSearches = 'recentSearches';

  Future<List<String>> getRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_keyRecentSearches) ?? '[]';
    final List<dynamic> list = jsonDecode(json);
    return list.cast<String>();
  }

  Future<void> addRecentSearch(String search) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> recentSearches = await getRecentSearches();
    if (!recentSearches.contains(search)) {
      recentSearches.insert(0, search);
      await prefs.setString(_keyRecentSearches, jsonEncode(recentSearches));
    }
  }

  Future<void> clearRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyRecentSearches);
  }
}
