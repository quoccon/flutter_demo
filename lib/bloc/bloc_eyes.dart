import 'package:flutter_bloc/flutter_bloc.dart';

class EyeIconEvent {}

class ToggleIconEvent extends EyeIconEvent {}

class EyeIconState {
  final bool isVisible;

  EyeIconState({required this.isVisible});
}

class EyeIconCubit extends Cubit<EyeIconState>{
  EyeIconCubit() : super(EyeIconState(isVisible: false));

  void toggleIcon(){
    emit(EyeIconState(isVisible: !state.isVisible));
  }
}