import 'dart:convert';
import 'package:http/http.dart' as http;

class HerokuService {
  static const String _baseUrl = 'https://ter-code-2c14b1c4c25a.herokuapp.com';

  static Future<String?> fetchDownloadUrl(String scriptId, String token) async {
    final url = Uri.parse('$_baseUrl/api/script?id=$scriptId&token=$token');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['download_url'];
      }
    } catch (e) {
      print('Error en fetchDownloadUrl: $e');
    }

    return null;
  }
}