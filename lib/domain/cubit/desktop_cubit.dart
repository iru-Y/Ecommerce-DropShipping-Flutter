import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'desktop_state.dart';

class DesktopCubit extends Cubit<DesktopState> {
  DesktopCubit() : super(DesktopInitial());
}
