import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../models/post.dart';
import 'event_card.dart';
import 'package:http/http.dart' as http;

class SelectOrganizationWidget extends StatefulWidget {
  const SelectOrganizationWidget({Key? key}) : super(key: key);

  @override
  _SelectOrganizationWidgetState createState() =>
      _SelectOrganizationWidgetState();
}

class _SelectOrganizationWidgetState extends State<SelectOrganizationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Event> posts = [];

  List<EventDate> date = [];

  bool isFetching = true;

  void fetchPost() async {
    //Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(
      Uri.parse(
          'https://us-central1-ticket-development-6f3af.cloudfunctions.net/app/get-events'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            'Basic ZEdsamEybDBYMkZ3YVE9PTpkR2xqYTJsMFgyRndhVjl3WVhOemQyOXlaRjhrSkNSZlpHVjJjdz09ZGtsd29zc3h3ZD1hcw==',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    );
    var result = json.decode(response.body) as List<dynamic>;
    List<Event> postsResult = result.map((body) {
      return Event(
          eventID: body['eventID'],
          eventName: body['eventName'],
          eventDate: body['title'],
          venueName: body['venueName'],
          eventImage: body['eventImage']);
          

          
    }).toList();

  


    setState(() {
      posts = postsResult;
      isFetching = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    //   return Scaffold(
    //     key: scaffoldKey,
    //     backgroundColor: const Color(0xFF1F262C),
    //     body: GestureDetector(
    //       onTap: () => FocusScope.of(context).unfocus(),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.max,
    //           children: [
    //             Column(mainAxisSize: MainAxisSize.max, children: [
    //               Material(
    //                 color: Colors.transparent,
    //                 elevation: 5,
    //                 shape: const RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.only(
    //                     bottomLeft: Radius.circular(15),
    //                     bottomRight: Radius.circular(15),
    //                     topLeft: Radius.circular(0),
    //                     topRight: Radius.circular(0),
    //                   ),
    //                 ),
    //                 child: Container(
    //                   width: double.infinity,
    //                   height: 120,
    //                   decoration: const BoxDecoration(
    //                     color: Color(0xFF242C3D),
    //                     borderRadius: BorderRadius.only(
    //                       bottomLeft: Radius.circular(15),
    //                       bottomRight: Radius.circular(15),
    //                       topLeft: Radius.circular(0),
    //                       topRight: Radius.circular(0),
    //                     ),
    //                   ),
    //                   child: Padding(
    //                     padding:
    //                         const EdgeInsetsDirectional.fromSTEB(0, 20, 20, 10),
    //                     child: Row(
    //                       mainAxisSize: MainAxisSize.max,
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       crossAxisAlignment: CrossAxisAlignment.end,
    //                       children: [
    //                         Row(
    //                           children: [
    //                             IconButton(
    //                               color: const Color(0xFF101213),
    //                               onPressed: () => Navigator.pop(context),
    //                               icon: const Icon(
    //                                 Icons.navigate_before,
    //                                 size: 30,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             const Text('My Events',
    //                                 style: TextStyle(
    //                                   fontFamily: 'Poppins',
    //                                   color: Color(0xFFF1F1F1),
    //                                   fontWeight: FontWeight.w600,
    //                                   fontSize: 24,
    //                                 )),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               // const EventCard(
    //               //   imageUrl:
    //               //       'https://images.unsplash.com/photo-1570872626485-d8ffea69f463?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
    //               //   venueName: "Tick'It Venue",
    //               //   eventDate: "27 October",
    //               //   eventName: "Event 1",
    //               // ),
    //               // const EventCard(
    //               //   imageUrl:
    //               //       'https://images.unsplash.com/photo-1570872626485-d8ffea69f463?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
    //               //   venueName: "Tick'It Venue",
    //               //   eventDate: "29 November",
    //               //   eventName: "Event 2",
    //               // )

    //             ]),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );

    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Scaffold(
         key: scaffoldKey,
        backgroundColor: const Color(0xFF1F262C),
        body: Container(
          child: ListView(
            children: posts.map((e) => EventCard(post: e)).toList(),
          ),
        ),
      ),
    );
  }
}
