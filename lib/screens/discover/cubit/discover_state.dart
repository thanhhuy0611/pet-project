part of 'discover_cubit.dart';

class DiscoverState extends Equatable {
  final List<UserData>? userData;
  final int page;
  final bool isGridView;
  const DiscoverState({this.userData, this.page = 1, this.isGridView = false,});

  DiscoverState copyWith({
    List<UserData>? userData,
    int? page,
    bool? isGridView,
  }) => DiscoverState(
    userData: userData ?? this.userData,
    page: page ?? this.page,
    isGridView: isGridView ?? this.isGridView,
  );

  @override
  List<Object?> get props => [
    userData,
    page,
    isGridView,
  ];
}
