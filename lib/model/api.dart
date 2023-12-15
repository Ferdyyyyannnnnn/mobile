import 'package:http/http.dart' as http;

class MusicApi {
  static Future<String> fetchImage() async {
    final response = await http.get(
      Uri.parse('https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
