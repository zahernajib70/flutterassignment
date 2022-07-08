import 'package:flutter/material.dart';

import 'events_listing.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SelectOrganizationWidget()
      },
    )
  );
}
