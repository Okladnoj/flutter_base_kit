import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await KitInitializer.initialize(
    errorHandler: (error) => loggerApp.e('Global error: $error'),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base Kit Example',
      home: const HomePage(),
    );
  }
}

// UI
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Base Kit - API Example')),
      body: BlocProvider(
        create: (context) => UsersCubit(),
        child: const UsersView(),
      ),
    );
  }
}

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Success button
          ElevatedButton(
            onPressed: cubit.fetchUsers,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('Fetch Users (Success)'),
          ),
          const SizedBox(height: 16),

          // Error button
          ElevatedButton(
            onPressed: cubit.fetchUsersWithError,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Fetch Users (Error)'),
          ),
          const SizedBox(height: 20),

          // Users list
          Expanded(
            child: AppConsumer<UsersCubit, UsersState>(
              builder: (state) {
                if (state.users.isEmpty) {
                  return const Center(
                    child: Text(
                      'No users loaded. Click "Fetch Users" to start.',
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return Card(
                      child: ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        leading: CircleAvatar(child: Text(user.name[0])),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// API Service
class UserApiService extends BaseService {
  Future<List<User>> getUsers() async {
    return await errorParser(() async {
      await Future.delayed(const Duration(seconds: 1));

      // Simulate API response
      return [
        User(id: 1, name: 'John Doe', email: 'john@example.com'),
        User(id: 2, name: 'Jane Smith', email: 'jane@example.com'),
        User(id: 3, name: 'Bob Johnson', email: 'bob@example.com'),
      ];
    });
  }

  Future<List<User>> getUsersWithError() async {
    return await errorParser(() async {
      await Future.delayed(const Duration(seconds: 1));

      // Simulate API error
      throw 'Failed to fetch users from server';
    });
  }
}

// Model
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

// State
class UsersState extends BaseStateI {
  final List<User> users;

  const UsersState({
    super.status = StateStatus.initial,
    super.message = '',
    this.users = const [],
  });

  UsersState copyWith({
    StateStatus? status,
    String? message,
    List<User>? users,
  }) {
    return UsersState(
      status: status ?? this.status,
      message: message ?? this.message,
      users: users ?? this.users,
    );
  }
}

// Cubit
class UsersCubit extends BaseCubit<UsersState> {
  final _apiService = UserApiService();

  UsersCubit() : super(const UsersState());

  Future<void> fetchUsers() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await safeAction(() {
      return _apiService.getUsers();
    });
    emit(state.copyWith(status: StateStatus.loaded));

    if (result == null) return;
    emit(state.copyWith(users: result));
  }

  Future<void> fetchUsersWithError() async {
    emit(state.copyWith(status: StateStatus.refresh));

    final result = await safeAction(_apiService.getUsersWithError);
    emit(state.copyWith(status: StateStatus.loaded));

    if (result == null) return;
    emit(state.copyWith(users: result));
  }
}
