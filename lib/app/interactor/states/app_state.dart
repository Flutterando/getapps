// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:getapps/app/interactor/entities/app_entity.dart';

abstract class AppState {
  final AppEntity app;

  const AppState(this.app);

  static AppState init(AppEntity app) {
    if (app is NotInstallAppEntity) {
      return NotInstallAppState(app);
    }
    return InstalledAppState(app);
  }

  AppState loading([AppEntity? app]) => LoadingAppState(app ?? this.app);

  AppState downloading(double percent) => DownloadingAppState(app, percent);

  AppState installed(AppEntity app) => InstalledAppState(app);

  AppState newUpdateAvaliable() => NewUpdateAvaliableAppState(app);
}

class NotInstallAppState extends AppState {
  const NotInstallAppState(super.app);
}

class LoadingAppState extends AppState {
  const LoadingAppState(super.app);
}

class DownloadingAppState extends AppState {
  final double percent;

  const DownloadingAppState(super.app, this.percent);

  @override
  bool operator ==(covariant DownloadingAppState other) {
    if (identical(this, other)) return true;

    return other.percent == percent;
  }

  @override
  int get hashCode => percent.hashCode;
}

class InstalledAppState extends AppState {
  const InstalledAppState(super.app);
}

class NewUpdateAvaliableAppState extends AppState {
  const NewUpdateAvaliableAppState(super.app);
}

class AppModel extends ChangeNotifier {
  AppState _state;
  AppState get state => _state;
  AppEntity get app => _state.app;

  AppModel(AppEntity app) : _state = AppState.init(app);

  void loading([_]) {
    _state = state.loading();
    notifyListeners();
  }

  void downloading(double percent) {
    _state = state.downloading(percent);
    notifyListeners();
  }

  void installed(AppEntity app) {
    _state = state.installed(app);
    notifyListeners();
  }

  void newUpdateAvaliable() {
    _state = state.newUpdateAvaliable();
    notifyListeners();
  }

  void update(AppState newState) {
    _state = newState;
    notifyListeners();
  }
}

final appsState = atom<List<AppModel>>([]);
