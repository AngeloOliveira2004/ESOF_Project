import 'package:flutter/material.dart';
import 'package:app/screens/signuppage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Sign Up Page - UI Test', (WidgetTester tester) async {
    // Build the SignUp widget
    await tester.pumpWidget(SignUp());

    // Verify that the Sign In and Sign Up buttons are displayed
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);

    // Verify that the Name, Surname, Email, and Password fields are displayed
    expect(find.byKey(const Key('nameField')), findsOneWidget);
    expect(find.byKey(const Key('surnameField')), findsOneWidget);
    expect(find.byKey(const Key('emailField')), findsOneWidget);
    expect(find.byKey(const Key('passwordField')), findsOneWidget);

    // Verify that the Next button is displayed
    expect(find.text('Next'), findsOneWidget);
  });
}
