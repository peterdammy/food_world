import 'package:flutter_riverpod/flutter_riverpod.dart';

class FaqExpansionNotifier extends StateNotifier<Map<int, bool>> {
  FaqExpansionNotifier() : super({});

  void toggleExpansion(int index) {
    final current = state[index] ?? false;
    state = {...state, index: !current};
  }
}

final faqExpansionProvider =
    StateNotifierProvider<FaqExpansionNotifier, Map<int, bool>>(
      (ref) => FaqExpansionNotifier(),
    );
