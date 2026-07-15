import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/auth/presentation/views/sign_up_view.dart';

class AppRouter {
  static const String initialRoute = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
