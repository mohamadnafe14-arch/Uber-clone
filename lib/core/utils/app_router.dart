import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/auth/presentation/views/sign_in_view.dart';
import 'package:uber_clone/features/auth/presentation/views/sign_up_view.dart';
import 'package:uber_clone/features/home/presentation/views/home_view.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String signInRoute = '/sign-in';
  static const String homeRoute = '/home';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: signInRoute,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),
    ],
  );
}
