import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/features/news/presentation/pages/news_headline_page.dart';

DateTime lastTimeBackButtonWasClicked = DateTime.now();

class AppExitWillPopScopeWidget extends StatefulWidget {
  const AppExitWillPopScopeWidget({super.key, required this.child});
  final Widget child;

  @override
  State<AppExitWillPopScopeWidget> createState() =>
      _AppExitWillPopScopeWidgetState();
}

class _AppExitWillPopScopeWidgetState extends State<AppExitWillPopScopeWidget> {
  @override
  void initState() {
    super.initState();
    lastTimeBackButtonWasClicked = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:
          ModalRoute.of(context)?.settings.name != NewsListingPage.routeName
              ? null
              : () async {
                  debugPrint(
                      'DateTime.now().difference(lastTimeBackButtonWasClicked) = ${DateTime.now().difference(lastTimeBackButtonWasClicked)}');
                  if (DateTime.now().difference(lastTimeBackButtonWasClicked) >=
                      const Duration(seconds: 1)) {
                    /* 

                    // 1 //
                    AppToast.show(
                      message: 'Press again to exit app',
                      type: SnackbarType.error,
                    ); 
                    */

                    // 2 // await showExitPopup(context);

                    // 3 //
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Press again to exit app"),
                    ));

                    lastTimeBackButtonWasClicked = DateTime.now();
                    return false;
                  } else {
                    return true;
                  }
                },
      child: widget.child,
    );
  }
}
