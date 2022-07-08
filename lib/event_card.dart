import 'package:flutter/material.dart';
import 'package:tickit_test/pages/post_page.dart';

import 'models/post.dart';

class EventCard extends StatelessWidget {
  // const EventCard({
  //   Key? key,
  //   required this.eventName,
  //   required this.venueName,
  //   required this.eventDate,
  //   required this.imageUrl,
  // }) : super(key: key);
  // final String eventName, venueName, eventDate, imageUrl;
  final Event post;
  const EventCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: InkWell(
        onTap: () {
          // print("event card pressed");
          // print(post.eventID);
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostPage(id: post.eventID)
            )
          );

        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: const Color(0x00F5F5F5),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  post.eventImage,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Material(
                color: Colors.transparent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0x00F44336), Color(0xCC000000)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.eventName,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 5),
                          child: Text(
                            '${post.venueName}  |  ${post.eventDate}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xCCEAEAEA),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
