import 'package:ecommerce_app/pages/notifications/widgets/notifications_list.dart';
import 'package:flutter/material.dart';

import 'notifications_header.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NotificationsHeader(),
        SizedBox(height: 20),
        NotificationsList(),
      ],
    );
  }
}
