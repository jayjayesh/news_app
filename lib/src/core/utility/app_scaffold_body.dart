import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppScaffoldBody extends StatelessWidget {
  const AppScaffoldBody({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return connected
            ? child
            : Stack(
                fit: StackFit.expand,
                children: [
                  if (connected == false)
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/no_internet.svg',
                      ),
                    ),
                  Positioned(
                    height: 24.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      color: connected
                          ? Color.fromARGB(255, 21, 165, 62)
                          : Color(0xFFEE4400),
                      child: Center(
                        child: Text(
                          "${connected ? 'ONLINE' : 'OFFLINE'}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
      child: child,
    );
  }
}
