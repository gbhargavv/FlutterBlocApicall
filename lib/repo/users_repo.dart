import 'package:http/http.dart' as http;
import '../models/users_model.dart';

class UsersRepo {
  Future<List<UsersModel>> getUsers() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    print('------ response : ' + response.body.toString());
    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
      // productsModel: const []));
    } else {
      throw Exception("Failed to load Users");
    }
  }
}

class NetworkError extends Error {}
