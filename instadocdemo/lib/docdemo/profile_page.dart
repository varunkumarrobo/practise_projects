import 'package:flutter/material.dart';
import 'package:instadocdemo/docdemo/theme.dart';
import 'package:provider/provider.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

//import '../../app/app.dart';
//import '../app_widgets/app_widgets.dart';
import 'app_state.dart';
import 'avatars.dart';

/// {@template profile_page}
/// User profile page. List of user created posts.
/// {@endtemplate}
class ProfilePage extends StatelessWidget {
  /// {@macro profile_page}
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatFeedCore(
      feedGroup: 'user',
      loadingBuilder: (context) =>
      const Center(child: CircularProgressIndicator()),
      errorBuilder: (context, error) => const Center(
        child: Text('Error loading profile'),
      ),
      emptyBuilder: (context) => const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _ProfileHeader(
              numberOfPosts: 0,
            ),
          ),
          SliverToBoxAdapter(
            child: _EditProfileButton(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
          SliverFillRemaining(child: _NoPostsMessage())
        ],
      ),
      feedBuilder: (context, activities) {
        return Text('TODO'); // TODO show activities
      },
    );
  }
}

class _EditProfileButton extends StatelessWidget {
  const _EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        onPressed: () {
          // TODO handle onPressed
        },
        child: const Text('Edit Profile'),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    Key? key,
    required this.numberOfPosts,
  }) : super(key: key);

  final int numberOfPosts;

  static const _statitisticsPadding =
  EdgeInsets.symmetric(horizontal: 12, vertical: 8.0);

  @override
  Widget build(BuildContext context) {
    final feedState = context.watch<AppState>();
    final streamagramUser = feedState.streamagramUser;
    if (streamagramUser == null) return const SizedBox.shrink();
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Avatar.big(
                streamagramUser: streamagramUser,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: _statitisticsPadding,
                  child: Column(
                    children: [
                      Text(
                        '$numberOfPosts',
                        style: AppTextStyle.textStyleBold,
                      ),
                      const Text(
                        'Posts',
                        style: AppTextStyle.textStyleLight,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: _statitisticsPadding,
                  child: Column(
                    children: [
                      Text(
                        '${FeedProvider.of(context).bloc.currentUser?.followersCount ?? 0}',
                        style: AppTextStyle.textStyleBold,
                      ),
                      const Text(
                        'Followers',
                        style: AppTextStyle.textStyleLight,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: _statitisticsPadding,
                  child: Column(
                    children: [
                      Text(
                        '${FeedProvider.of(context).bloc.currentUser?.followingCount ?? 0}',
                        style: AppTextStyle.textStyleBold,
                      ),
                      const Text(
                        'Following',
                        style: AppTextStyle.textStyleLight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(streamagramUser.fullName,
                style: AppTextStyle.textStyleBoldMedium),
          ),
        ),
      ],
    );
  }
}

class _NoPostsMessage extends StatelessWidget {
  const _NoPostsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This is too empty'),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            // TODO handle onPressed
          },
          child: const Text('Add a post'),
        )
      ],
    );
  }
}