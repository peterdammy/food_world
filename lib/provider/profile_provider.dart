import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_world/model/profile_model.dart';
import 'package:food_world/views/screens/profile/faq_screen.dart';
import 'package:food_world/views/screens/profile/notif_screen.dart';
import 'package:food_world/views/screens/profile/personal_info_screen.dart';
import 'package:food_world/views/screens/profile/recent_order.dart';

final List<ProfileModel> profileOptions = [
  ProfileModel(
    profileOptionsIcon: SvgPicture.asset('assets/icon/message.svg'),
    profileOptionsTitle: 'FAQ',
    onPressed: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FaqScreen()),
      );
    },
  ),

  ProfileModel(
    profileOptionsIcon: SvgPicture.asset('assets/icon/notif.svg'),
    profileOptionsTitle: 'Notification',
    onPressed: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotifScreen()),
      );
    },
  ),

  ProfileModel(
    profileOptionsIcon: SvgPicture.asset('assets/icon/person.svg'),
    profileOptionsTitle: 'Personal Information',
    onPressed: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
      );
    },
  ),

  ProfileModel(
    profileOptionsIcon: SvgPicture.asset('assets/icon/orders.svg'),
    profileOptionsTitle: 'Recent Orders',
    onPressed: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecentOrder()),
      );
    },
  ),
];

final profileOptionsProvider = Provider((ref) => profileOptions);
