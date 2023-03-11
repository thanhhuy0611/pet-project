part of '../index.dart';

class DiscoverBottomNavigation extends StatelessWidget {
  const DiscoverBottomNavigation({Key? key}) : super(key: key);

  Widget _buildIconButton({
    required String icon,
    required BuildContext context,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: IconButton(
        onPressed: () {}, 
        icon: Image.asset(
          'assets/images/$icon',
          width: 14.0,
          height: 14.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor, 
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            offset: const Offset(0.0, -0.5),
          )
        ],
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildIconButton(icon: 'home_icon.png', context: context,),
            _buildIconButton(icon: 'search_icon.png', context: context,),
            DiscoverAddButton(onTap: () {}),
            _buildIconButton(icon: 'chat_icon.png', context: context,),
            _buildIconButton(icon: 'person_icon.png', context: context,),
          ],
        ),
      ),
    );
  }
}
