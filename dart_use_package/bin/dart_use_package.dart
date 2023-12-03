import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('https://example.com');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
