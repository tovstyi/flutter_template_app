import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    on<SessionEvent>((SessionEvent event, Emitter<SessionState> emit) {
      // TODO: implement event handler
    });
  }
}
