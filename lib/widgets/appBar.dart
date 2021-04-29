import 'package:flutter/material.dart';
import 'package:skype_clone/utils/universal_variables.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;

  const CustomAppBar(
      {Key key,
      @required this.title,
      @required this.actions,
      @required this.leading,
      @required this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: UniversalVariables.blackColor,
        border: Border(
          bottom: BorderSide(
              color: UniversalVariables.separatorColor,
              width: 1.4,
              style: BorderStyle.solid),
        ),
      ),
      child: AppBar(
        backgroundColor: UniversalVariables.blackColor,
        centerTitle: centerTitle,
        actions: actions,
        title: title,
        elevation: 0,
        leading: leading,
      ),
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);
}
