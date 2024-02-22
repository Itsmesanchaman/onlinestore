import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinestore/api_service/api_service.dart';

final productsProvider = FutureProvider((ref) => ApiService.getProducts());


