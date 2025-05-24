class AuthService {
  static bool _isProUser = false;

  /// Simulación local de activación de versión PRO.
  /// En una app real se conectaría a Firebase Auth o un sistema de licencias.
  static bool get isPro => _isProUser;

  static void activatePro() {
    _isProUser = true;
  }

  static void deactivatePro() {
    _isProUser = false;
  }

  /// Esta función puede reemplazarse por una validación online
  static Future<bool> checkProStatus() async {
    // Aquí puedes validar desde Firebase si el usuario es PRO.
    return Future.value(_isProUser);
  }
}