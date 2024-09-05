import 'package:bloc/bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }

  int currentIndex() {
    return  super.state;    
  }
}
