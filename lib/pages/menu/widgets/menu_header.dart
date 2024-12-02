import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          buildTitle(),
          const SizedBox(height: 20),
          Row(
            children: [
              buildImageProfile(),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gareth Miller',
                    style: AppTextStyle.semiBold(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'gareth.miller@email.com',
                    style: AppTextStyle.regular(
                      color: AppColors.gray1,
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Row(
      children: [
        Text(
          'My Account',
          style: AppTextStyle.bold(fontSize: 32),
        ),
      ],
    );
  }

  Widget buildImageProfile() {
    double size = 80;
    return Image.asset(
      'assets/images/profile.png',
      width: size,
    );
  }
}
