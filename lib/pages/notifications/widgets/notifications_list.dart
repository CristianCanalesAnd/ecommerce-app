import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NotificationWidget(
          title: "Your order #85739 has been succesfully!",
          time: "15 mins ago",
          icon: 'assets/images/notifications/notifications1.png',
        ),
        NotificationWidget(
          title: "Special Big Sale up to 50% Off all product today!",
          time: "50 mins ago",
          icon: 'assets/images/notifications/notifications2.png',
        ),
        NotificationWidget(
          title: "Your order #85739 has been shipped!",
          time: "1 day ago",
          icon: 'assets/images/notifications/notifications3.png',
        ),
        NotificationWidget(
          title: "Your order #85739 has been succesfully!",
          time: "2 days ago",
          icon: 'assets/images/notifications/notifications1.png',
        ),
        NotificationWidget(
          title: "Your order #85739 has been succesfully!",
          time: "3 days ago",
          icon: 'assets/images/notifications/notifications1.png',
        ),
      ],
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final String title;
  final String time;
  final String icon;

  const NotificationWidget({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.gray4,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            buildIcon(),
            const SizedBox(width: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleLabel(),
                  const SizedBox(height: 10),
                  buildTimeLabel(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIcon() {
    double size = 45;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.gray5,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        icon,
        width: size,
      ),
    );
  }

  Widget buildTitleLabel() {
    return Text(
      title,
      style: AppTextStyle.regular(
        fontSize: 20,
      ),
      maxLines: 2,
    );
  }

  Widget buildTimeLabel() {
    return Text(
      time,
      style: AppTextStyle.regular(
        color: AppColors.gray1,
        fontSize: 20,
      ),
    );
  }
}
