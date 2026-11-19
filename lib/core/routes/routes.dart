import 'package:go_router/go_router.dart';
import 'package:masar_app/core/routes/routes_name.dart';

class Routes {
 static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash, routes: [
            GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        // builder: (context, state) => SplashScreen(),
      )
    ],
 );
}