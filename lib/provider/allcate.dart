import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinestore/api_service/api_service.dart';

final AllCateProvider = FutureProvider((ref) => AllCateService.getAllCate());

final cateProvider = FutureProvider.family((ref, String specific) => ApiService.getSpecificProduct(specific:specific));