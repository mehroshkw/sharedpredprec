import 'package:http/http.dart' as http;
import 'home.dart';
import 'model.dart';

class ApiServices {
  Future<List<User>?> getUser() async {
    var url = Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/food");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        List<User> data = userFromJson(res.body);
        print(res.body);
        return data;
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
