import 'package:auto_route/auto_route.dart';

import 'app_routes.dart';
export 'app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/splash',
          initial: true,
          page: SplashRoute.page,
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/categories',
          page: CategoriesRoute.page,
        ),
        AutoRoute(
          path: '/category-products',
          page: CategoryProductsRoute.page,
        ),
        AutoRoute(
          path: '/products',
          page: ProductsRoute.page,
        ),
        AutoRoute(
          path: '/create-product',
          page: CreateProductRoute.page,
        ),
        AutoRoute(
          path: '/product',
          page: ProductRoute.page,
        ),
        AutoRoute(
          path: '/blogs-posts',
          page: BlogPostsRoute.page,
        ),
      ];
}
