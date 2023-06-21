abstract class HomeStates {}

class HomeIntialState extends HomeStates {}

class GetDataLoadingState extends HomeStates {}

class GetDataSuccessState extends HomeStates {
  List<Map<String, dynamic>> data;
  GetDataSuccessState({required this.data});
}

class GetDataFailureState extends HomeStates {}
