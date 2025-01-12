import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  final List _eventList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HttpPage'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(_eventList[index].avatarUrl),
            title: Text(_eventList[index].name.toString()),
            subtitle: Text(_eventList[index].id.toString()),
          );
        },
        itemCount: _eventList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = Uri.parse('https://api.github.com/events');
          var res = await http.get(url);
          if (res.statusCode == 200) {
            // 解析 json
            final json = convert.jsonDecode(res.body);
            try {
              setState(() {
                _eventList.addAll(json.map((e) => GithubEvent(e)).toList());
              });
            } catch (e) {
              print(e);
            }
          } else {
            print(res);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 解析 json的类
class GithubEvent {
  late String? id;
  late String? avatarUrl;
  late String name;

  GithubEvent(json) {
    this.id = json['id'];
    this.name = json['actor']['login'];
    this.avatarUrl = json['actor']['avatar_url'];
  }
}
