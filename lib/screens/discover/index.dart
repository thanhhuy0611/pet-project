import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jaho_challenge/model/user_response.dart';
import 'package:jaho_challenge/repository/user_repository.dart';
import 'package:jaho_challenge/widget/author_info.dart';
import 'package:jaho_challenge/widget/button/button_decoration.dart';
import 'package:jaho_challenge/widget/button/outlined_button.dart';
import 'package:jaho_challenge/widget/floating_button.dart';

import 'cubit/discover_cubit.dart';

part 'widgets/bottom_navigator.dart';
part 'widgets/discover_add_button.dart';

class DiscoverScreen extends StatelessWidget {
  static const PAGE_NAME = '/discover';
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverCubit(userRepo: context.read<UserRepository>())..fetchUserData(),
      child: BlocBuilder<DiscoverCubit, DiscoverState>(
        builder: (context, state) {
          if (state.userData == null || state.userData!.isEmpty) {
            return const SizedBox();
          }
          return Scaffold(
            floatingActionButton: SettingThemeFloatingButton(
              optionButton: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  child: IconButton(
                    icon: state.isGridView
                        ? const Icon(Icons.list, color: Colors.amber)
                        : const Icon(Icons.grid_on, color: Colors.amber),
                    onPressed: () {
                      context.read<DiscoverCubit>().switchView();
                    },
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation: SettingThemeFloatingButton.location,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: state.isGridView
                    ? StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: state.userData!.length + 1,
                        itemBuilder: (BuildContext ctx, int index) {
                          if (index == state.userData!.length) {
                            return _buildSeeMoreButton(context);
                          }

                          final user = state.userData![index];
                          return _buildUserSection(context, user, index == 0);
                        },
                        staggeredTileBuilder: (int index) {
                          if (index == 0) {
                            return const StaggeredTile.fit(4);
                          }
                          if (index == state.userData!.length) {
                            return const StaggeredTile.fit(4);
                          }
                          return const StaggeredTile.count(2, 2.7);
                        },
                        mainAxisSpacing: 9.0,
                        crossAxisSpacing: 9.0,
                      )
                    : ListView.builder(
                        itemCount: state.userData!.length + 1,
                        itemBuilder: (context, index) {
                          if (index == state.userData!.length) {
                            return _buildSeeMoreButton(context);
                          }

                          final user = state.userData![index];
                          return _buildUserSection(context, user, index == 0);
                        },
                      ),
              ),
            ),
            // bottomNavigationBar: const DiscoverBottomNavigation(),
          );
        },
      ),
    );
  }

  Widget _buildSeeMoreButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: CustomOutlinedButton(
          label: (AppLocalizations.of(context)!.see_more).toUpperCase(),
          onTap: () => context.read<DiscoverCubit>().fetchUserData(),
        ));
  }

  Widget _buildUserSection(BuildContext context, UserData user, bool isFistItme) {
    final header = [
      const SizedBox(height: 16),
      Text(
        AppLocalizations.of(context)!.discover,
        style: Theme.of(context).textTheme.headline1,
      ),

      // New today
      const SizedBox(height: 32),
      Text(
        (AppLocalizations.of(context)!.whats_new_today).toUpperCase(),
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 24),
    ];

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...isFistItme ? header : [],
        user.avatar == null || user.avatar!.isEmpty
            ? Image.asset(
                'assets/images/1',
                fit: BoxFit.fitWidth,
                width: double.infinity,
              )
            : ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 180),
                child: CachedNetworkImage(
                  imageUrl: user.avatar!,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),

        // Author
        const SizedBox(height: 16),
        AuthorInfoWidget(user: user),
        const SizedBox(height: 24),
      ],
    );
  }
}
