import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  try {
    var response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<dynamic> characters = data['results'];

      characters.forEach((character) {
        print(character['name']);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Failed to load data: $e');
  }
}

void main() async {
  await printRmCharacters();
}