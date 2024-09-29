State Management with Provider
This project uses the Provider package for state management, which simplifies the way state is
passed and shared across the app.

1. ChangeNotifier
   ChangeNotifier is a simple class in Flutter that provides change notifications to its listeners.
   It is commonly used for managing state in a lightweight manner. Whenever there’s a change in the
   state, ChangeNotifier notifies its listeners, triggering a rebuild of the relevant parts of the
   UI.

2. ChangeNotifierProvider
   ChangeNotifierProvider is the most common way to provide a ChangeNotifier to the widget tree. It
   listens to the ChangeNotifier and ensures that all consumers are rebuilt when there is a state
   change.

Example:

ChangeNotifierProvider(
create: (context) => MyChangeNotifier(),
child: MyApp(),
);

3. Consumer
   The Consumer widget allows you to listen to the state changes provided by ChangeNotifierProvider
   and rebuild only the part of the UI that depends on the state.

Example:

Consumer<MyChangeNotifier>(
builder: (context, notifier, child) {
return Text('Value: ${notifier.value}');
},
);
Summary of Provider
Provider is a wrapper around the InheritedWidget in Flutter, making it easy to propagate data
through the widget tree. It allows for a clean architecture where business logic and UI are
separated, making the app more maintainable and testable. By using ChangeNotifier,
ChangeNotifierProvider, and Consumer, you can efficiently manage and respond to state changes in
your Flutter app.

