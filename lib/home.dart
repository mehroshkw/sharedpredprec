import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'apiservice.dart';
import 'model.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiServices client = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP Api Practice"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>?>(
        future: client.getUser(),
        builder: (context, snapshot) {
          var resp = snapshot.data;
          return ListView.builder(
              itemCount: resp!.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(
                      resp[index].meanings![index].partOfSpeech.toString()),
                  // resp[index].license!.name.toString()),
                  // resp[index].word.toString()),
                  // resp[index].phonetic.toString()),
                  // resp[index].sourceUrls.toString()),
                );
              }));
        },
      ),
    );
  }
}
