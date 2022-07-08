import 'package:flutter/material.dart';
import 'package:tickit_test/models/eventdetails.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Details detail;
  final EventDate1? date1;

  const PostCard({Key? key, required this.detail, required this.date1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 
    return Column(
      children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("${detail.eventName}",
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  detail.eventImage,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  "${detail.venueName}| ${detail.eventDate}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, height: 1.35),
                ),
              ),
              Text(detail.eventDescription,
                  style: const TextStyle(height: 1.35)),
              Text("Rating :" + detail.eventRating.toString()),
              Text("Lineup List :" + detail.lineupList.toString()),
              Text("Muisic Types :" + detail.musicTypes.toString()),
            ],
          ),
        ))
      ],
    );
  }
}
