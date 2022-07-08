import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tickit_test/models/eventdetails.dart';

import '../models/post.dart';
import '../widgets/loading.dart';
import '../widgets/post_card.dart';

class PostPage extends StatefulWidget {
  final String id;
  const PostPage({Key? key, required this.id}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool isFetching = true;
  late Details detail;
  late EventDate1 date;

  List<Details> details = [];

  void getPost(String? id) async {
    var params = {
      "eventID": widget.id,
    };
    // Uri uri =
    //     Uri.parse("https://jsonplaceholder.typicode.com/posts/${widget.id}");
    var response = await http.post(
      Uri.parse(
          'https://us-central1-ticket-development-6f3af.cloudfunctions.net/app/get-event-byID'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            'Basic ZEdsamEybDBYMkZ3YVE9PTpkR2xqYTJsMFgyRndhVjl3WVhOemQyOXlaRjhrSkNSZlpHVjJjdz09ZGtsd29zc3h3ZD1hcw==',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: jsonEncode({
        "eventID": widget.id,
      }),
    );
    var e = json.decode(response.body) as Map<String, dynamic>;

    setState(() {
      detail = Details(
        eventID: e['eventID'],
        eventName: e['eventName'],
        eventDate: e['title'],
        venueName: e['venueName'],
        eventDescription: e['eventDescription'],
        eventRating: e['eventRating'],
        lineupList: e['lineupList'],
        musicTypes: e['musicTypes'],
        eventImage: e['eventImage'],
      );

      date = EventDate1(
        iNanoseconds: e['iNanoseconds'],
        iSeconds: e['iSeconds'],
      );

      isFetching = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPost(widget.id);
    // print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event details"),
      ),
      body: Container(
          child: isFetching ? const Loading() : PostCard(detail: detail,date1: date,)),
    );
  }
}
