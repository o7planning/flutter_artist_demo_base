import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../model/model.dart';
import '../widgets/image_url_view.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LoggedInUserBuilder(
      ownerClassInstance: this,
      description: null,
      build: (ILoggedInUser? user) {
        LoggedInUserData? loggedInUserData =
            FlutterArtist.loggedInUser as LoggedInUserData?;
        return _buildMain(loggedInUserData?.appUser);
      },
    );
  }

  Widget _buildMain(AppUserData? loginInfo) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[150],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            ImageUrlView(imageUrl: loginInfo?.imageUrl, size: 90),
            const SizedBox(height: 8),
            Text(
              loginInfo?.fullName ?? "-",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              loginInfo?.email ?? "-",
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
