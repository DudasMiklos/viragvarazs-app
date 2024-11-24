// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:viragvarazs/src/models/product/product_model.dart' as _i12;
import 'package:viragvarazs/src/models/totalCategory/total_category_model.dart'
    as _i11;
import 'package:viragvarazs/src/ui/pages/blog_posts_page.dart' as _i1;
import 'package:viragvarazs/src/ui/pages/categories_page.dart' as _i2;
import 'package:viragvarazs/src/ui/pages/category_products_page.dart' as _i3;
import 'package:viragvarazs/src/ui/pages/create_product_page.dart' as _i4;
import 'package:viragvarazs/src/ui/pages/login_page.dart' as _i5;
import 'package:viragvarazs/src/ui/pages/product_page.dart' as _i6;
import 'package:viragvarazs/src/ui/pages/products_page.dart' as _i7;
import 'package:viragvarazs/src/ui/pages/splash_page.dart' as _i8;

/// generated route for
/// [_i1.BlogPostsPage]
class BlogPostsRoute extends _i9.PageRouteInfo<void> {
  const BlogPostsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          BlogPostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogPostsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.BlogPostsPage();
    },
  );
}

/// generated route for
/// [_i2.CategoriesPage]
class CategoriesRoute extends _i9.PageRouteInfo<void> {
  const CategoriesRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.CategoriesPage();
    },
  );
}

/// generated route for
/// [_i3.CategoryProductsPage]
class CategoryProductsRoute
    extends _i9.PageRouteInfo<CategoryProductsRouteArgs> {
  CategoryProductsRoute({
    _i10.Key? key,
    required _i11.TotalCategoryModel totalCategory,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CategoryProductsRoute.name,
          args: CategoryProductsRouteArgs(
            key: key,
            totalCategory: totalCategory,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryProductsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryProductsRouteArgs>();
      return _i3.CategoryProductsPage(
        key: args.key,
        totalCategory: args.totalCategory,
      );
    },
  );
}

class CategoryProductsRouteArgs {
  const CategoryProductsRouteArgs({
    this.key,
    required this.totalCategory,
  });

  final _i10.Key? key;

  final _i11.TotalCategoryModel totalCategory;

  @override
  String toString() {
    return 'CategoryProductsRouteArgs{key: $key, totalCategory: $totalCategory}';
  }
}

/// generated route for
/// [_i4.CreateProductPage]
class CreateProductRoute extends _i9.PageRouteInfo<void> {
  const CreateProductRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CreateProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProductRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.CreateProductPage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.ProductPage]
class ProductRoute extends _i9.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i10.Key? key,
    required _i12.ProductModel product,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>();
      return _i6.ProductPage(
        key: args.key,
        product: args.product,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i10.Key? key;

  final _i12.ProductModel product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i7.ProductsPage]
class ProductsRoute extends _i9.PageRouteInfo<void> {
  const ProductsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProductsPage();
    },
  );
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashPage();
    },
  );
}
