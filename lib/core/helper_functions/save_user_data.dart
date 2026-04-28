import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _idKey = "id";
  static const String _fullNameKey = "fullName";
  static const String _emailKey = "email";
  static const String _phoneKey = "phoneNumber";
  static const String _ageKey = "age";
  static const String _addressKey = "address";
  static const String _profileImageKey = "profileImageUrl";
  static const String _accessTokenKey = "accessToken";
  static const String _refreshTokenKey = "refreshToken";
  static const String _roleKey = "role";
  static const String _isEmailConfirmedKey = "isEmailConfirmed";

  static const String _tempUserIdKey = "tempUserId";
  static const String _tokenKey = "token";
  static const String _userIdKey = "userId";

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) ?? '';
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static Future<void> saveUserData({
    required String id,
    required String fullName,
    required String email,
    required String phoneNumber,
    required int age,
    required String address,
    String? profileImageUrl,
    required String accessToken,
    required String refreshToken,
    required String role,
    required bool isEmailConfirmed,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_idKey, id);
    await prefs.setString(_fullNameKey, fullName);
    await prefs.setString(_emailKey, email);
    await prefs.setString(_phoneKey, phoneNumber);
    await prefs.setInt(_ageKey, age);
    await prefs.setString(_addressKey, address);
    if (profileImageUrl != null) {
      await prefs.setString(_profileImageKey, profileImageUrl);
    }
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
    await prefs.setString(_roleKey, role);
    await prefs.setBool(_isEmailConfirmedKey, isEmailConfirmed);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'id': prefs.getString(_idKey) ?? '',
      'fullName': prefs.getString(_fullNameKey) ?? '',
      'email': prefs.getString(_emailKey) ?? '',
      'phoneNumber': prefs.getString(_phoneKey) ?? '',
      'age': prefs.getInt(_ageKey) ?? 0,
      'address': prefs.getString(_addressKey) ?? '',
      'profileImageUrl': prefs.getString(_profileImageKey),
      'accessToken': prefs.getString(_accessTokenKey) ?? '',
      'refreshToken': prefs.getString(_refreshTokenKey) ?? '',
      'role': prefs.getString(_roleKey) ?? '',
      'isEmailConfirmed': prefs.getBool(_isEmailConfirmedKey) ?? false,
    };
  }

  static Future<void> saveLoginData({
    required String id,
    required String email,
    required String phoneNumber,
    required String accessToken,
    required String refreshToken,
    required String role,
    required bool isEmailConfirmed,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_idKey, id);
    await prefs.setString(_emailKey, email);
    await prefs.setString(_phoneKey, phoneNumber);
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
    await prefs.setString(_roleKey, role);
    await prefs.setBool(_isEmailConfirmedKey, isEmailConfirmed);
  }


  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey) ?? '';
  }

  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
  }

  // دوال الـ temp userId
  static Future<void> saveTempUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tempUserIdKey, userId);
  }

  static Future<String> getTempUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tempUserIdKey) ?? '';
  }

  static Future<void> clearTempUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tempUserIdKey);
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_idKey);
    await prefs.remove(_fullNameKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_phoneKey);
    await prefs.remove(_ageKey);
    await prefs.remove(_addressKey);
    await prefs.remove(_profileImageKey);
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_roleKey);
    await prefs.remove(_isEmailConfirmedKey);
  }
}