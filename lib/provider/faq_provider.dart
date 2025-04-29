import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/model/faq_model.dart';

final List<FaqModel> faqPageContent = [
  FaqModel(
    faqTitle: 'Lorem ipsum dolet sit amet',
    faqContent:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rhoncus dui urna, a efficitur purus lobortis in. Donec in condimentum ligula, id rutrum velit.',
  ),

  FaqModel(
    faqTitle: 'Donec in condimentum ligula Lorem ipsum dolor sit am?',
    faqContent:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rhoncus dui urna, a efficitur purus lobortis in. Donec in condimentum ligula, id rutrum velit.',
  ),

  FaqModel(
    faqTitle: 'A efficitur purus lobortis in?',
    faqContent:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rhoncus dui urna, a efficitur purus lobortis in. Donec in condimentum ligula, id rutrum velit.',
  ),

  FaqModel(
    faqTitle: 'Vestibulum rhoncus dui urna a efficitur purus lobortis in?',
    faqContent:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rhoncus dui urna, a efficitur purus lobortis in. Donec in condimentum ligula, id rutrum velit.',
  ),

  FaqModel(
    faqTitle: 'Consectetur adipiscing elit Vesti?',
    faqContent:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rhoncus dui urna, a efficitur purus lobortis in. Donec in condimentum ligula, id rutrum velit.',
  ),
];

final faqPageContentProvider = Provider((ref) => faqPageContent);
