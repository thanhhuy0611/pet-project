import 'package:flutter/material.dart';
import 'package:jaho_challenge/model/user_response.dart';

class AuthorInfoWidget extends StatelessWidget {
  final UserData user;
  const AuthorInfoWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${user.firstName ?? ''} ${user.lastName ?? ''}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(user.email ?? '',
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      ],
    );
  }
}
