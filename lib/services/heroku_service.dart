import 'dart:convert';
import 'package:http/http.dart' as http;

class HerokuService {
  static const String _baseUrl = 'https://tu-app.herokuapp.com/api';

  /// Descarga el script desde el servidor Heroku
  static Future<String?> fetchScript(String scriptId) async {
    final url = Uri.parse('$_baseUrl/script?id=$scriptId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['script_content']; // Contenido plano del script
      } else {
        print('Error del servidor: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Excepción al conectar con Heroku: $e');
      return null;
    }
  }
}