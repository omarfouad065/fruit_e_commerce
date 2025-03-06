import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/core/widgets/notification_widget.dart';

AppBar buildAppBar(BuildContext context,
    {required String title,
    bool showBackButton = true,
    bool showNotification = true}) {
  return AppBar(
    actions: [
      Visibility(
        visible: showNotification,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
    leading: Visibility(
      visible: showBackButton,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  );
}
