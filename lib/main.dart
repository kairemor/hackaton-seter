import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackatonseter/ui/auth/auth_bloc.dart';
import 'package:hackatonseter/ui/auth/auth_event.dart';
import 'package:hackatonseter/ui/auth/auth_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(FirebaseAuth.instance),
      child: MaterialApp(
        title: 'Flutter Firebase Auth with Bloc',
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return HomeScreen();
        } else if (state is Unauthenticated) {
          return AuthScreen();
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing the user from the authenticated state of AuthBloc
    final user = context.select((AuthBloc bloc) => bloc.state is Authenticated
        ? (bloc.state as Authenticated).user
        : null);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (user != null)
              Text(
                'Welcome, ${user.email}',
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Dispatching a logout event to AuthBloc
                context.read<AuthBloc>().add(AuthLogoutRequested());
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authentication')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Dispatching SignInRequested event with sample credentials
            context
                .read<AuthBloc>()
                .add(SignInRequested('test@example.com', 'password'));
          },
          child: Text('Sign In'),
        ),
      ),
    );
  }
}
