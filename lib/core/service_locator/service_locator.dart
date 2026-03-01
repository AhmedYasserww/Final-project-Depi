// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:marketi_app/features/auth/data/repos/auth_repo/auth_repo_imp.dart';
// import 'package:marketi_app/features/cart/data/repo/cart_repo_imp.dart';
// import 'package:marketi_app/features/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
// import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
// import 'package:marketi_app/features/favorite/data/repos/favorite_repo_imp.dart';
// import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
// import 'package:marketi_app/features/home/data/repos/get_all_brands_repo/get_all_brands_repo_imp.dart';
// import 'package:marketi_app/features/home/data/repos/get_all_categories_repo/get_all_category_repo_imp.dart';
// import 'package:marketi_app/features/home/data/repos/get_all_products_by_single_category_repo/get_all_product_by_single_product_repo_imp.dart';
// import 'package:marketi_app/features/home/data/repos/get_all_products_repo/get_all_product_repo_imp.dart';
// import 'package:marketi_app/features/home/data/repos/product_filter/product_filter_repo_imp.dart';
// import 'package:marketi_app/features/profile/data/repos/profile_repo_imp.dart';
// import 'package:marketi_app/features/search/data/repo/search_repo_imp.dart';
// import 'package:marketi_app/features/search/presentations/manager/search_for_product_cubit/search_for_product_cubit.dart';
// import '../network/api_service.dart';
//
// final getIt = GetIt.instance;
//
// void setupServiceLocator() {
//   getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
//   getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService:getIt.get<ApiService>(),));
//   getIt.registerSingleton<GetAllProductRepoImp>(GetAllProductRepoImp(apiService:getIt.get<ApiService>(),));
//   getIt.registerSingleton<GetAllCategoryRepoImp>(GetAllCategoryRepoImp(apiService:getIt.get<ApiService>(),));
//   getIt.registerSingleton<GetAllBrandsRepoImp>(GetAllBrandsRepoImp(apiService:getIt.get<ApiService>(),));
//   getIt.registerSingleton<SearchRepoImp>(
//     SearchRepoImp(apiService: getIt.get<ApiService>()),
//   );
//   getIt.registerFactory<SearchForProductCubit>(() => SearchForProductCubit(
//       getIt<SearchRepoImp>(),
//       ));
//   getIt.registerSingleton<GetAllProductBySingleProductRepoImp>(
//     GetAllProductBySingleProductRepoImp(apiService: getIt.get<ApiService>()),
//   );
//   getIt.registerSingleton<GetFilteredProductsRepoImp>(
//     GetFilteredProductsRepoImp(apiService: getIt.get<ApiService>()),
//   );
//
//   getIt.registerSingleton<CartRepoImp>(
//     CartRepoImp(apiService: getIt.get<ApiService>()),
//   );
//   // getIt.registerFactory<GetCartCubit>(() => GetCartCubit(
//   //   getIt<CartRepoImp>(),
//   // ));
//   getIt.registerFactory<AddToCartCubit>(() => AddToCartCubit(
//     getIt<CartRepoImp>(),
//   ));
//   // getIt.registerFactory<DeleteFromCartCubit>(() => DeleteFromCartCubit(
//   //   getIt<CartRepoImp>(),
//   // ));
//   getIt.registerFactory<CartCubit>(() => CartCubit(
//     getIt<CartRepoImp>(),
//   ));
//
//   // getIt.registerFactory<AddToFavoriteCubit>(() => AddToFavoriteCubit(
//   //   getIt<FavoriteRepoImp>(),
//   // ));
//   getIt.registerSingleton<FavoriteRepoImp>(
//     FavoriteRepoImp(apiService: getIt.get<ApiService>()),
//   );
//   getIt.registerSingleton<ProfileRepoImp>(
//     ProfileRepoImp(apiService: getIt.get<ApiService>()),
//   );
//   getIt.registerFactory<FavoriteCubit>(() => FavoriteCubit(
//     getIt<FavoriteRepoImp>(),
//   ));
//
// }
//
