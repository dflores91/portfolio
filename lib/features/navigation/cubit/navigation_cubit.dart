import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationSection {
  about,
  expertise,
  projects,
  journey,
  skills,
  education,
  contact,
}

class NavigationState {
  const NavigationState({
    this.activeSection = NavigationSection.about,
  });

  final NavigationSection activeSection;
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void setSection(NavigationSection section) {
    if (state.activeSection != section) {
      emit(NavigationState(activeSection: section));
    }
  }
}
