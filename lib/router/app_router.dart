
import 'package:auto_route/auto_route.dart';
import '../core/locator/locator.dart';
import '../ui/auth/login/ui/login_page.dart';
import '../ui/auth/sign_up/sign_up_page.dart';
import '../ui/home/home_page.dart';
import '../ui/splash/splash_page.dart';
import '../ui/home/transfarPage.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page,),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: TransfarRoute.page,initial: true),

    // AutoRoute(page: VideoCal.page)
  ];
}

final appRouter = locator<AppRouter>();
