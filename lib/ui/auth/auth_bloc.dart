import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._firebaseAuth) : super(AuthInitial()) {
    on<AuthRequested>((event, emit) async {
      try {
        final User? user = _firebaseAuth.currentUser;
        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(Unauthenticated());
        }
      } catch (_) {
        emit(Unauthenticated());
      }
    });

    on<AuthLogoutRequested>(_handleLogout);
  }

  Future<void> _handleLogout(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    try {
      await _firebaseAuth.signOut();
      emit(Unauthenticated());
    } catch (e) {
      // Optionally handle errors, e.g., by emitting a specific 'Error' state
      print('Error logging out: $e');
      // You could emit an error state or re-emit the authenticated state with an error message
      // For simplicity, just re-emitting the Unauthenticated state here
      emit(Unauthenticated());
    }
  }
}
