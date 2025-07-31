/// Core module for Flutter Base Kit
///
/// This module provides the foundation classes for state management
/// and error handling in Flutter applications. It includes:
///
/// - [BaseProvider] - Base class for ChangeNotifier-based state management
/// - [BaseBloc] - Base class for BLoC pattern implementation
/// - [BaseCubit] - Base class for Cubit pattern implementation
/// - [BaseEvent] - Base class for BLoC events
/// - [BaseState] - Common state management utilities
///
/// All classes include built-in error handling, loading states,
/// and logging capabilities.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logger.dart';
import '../exceptions/base_exception.dart';

part 'common/base_state.dart';
part 'provider/base_provider.dart';
part 'bloc/base_bloc.dart';
part 'bloc/base_event.dart';
part 'cubit/base_cubit.dart';
