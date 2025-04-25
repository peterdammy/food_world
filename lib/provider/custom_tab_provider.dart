// providers/tab_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);
