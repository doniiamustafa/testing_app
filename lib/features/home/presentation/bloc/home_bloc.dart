import 'package:bloc/bloc.dart';
import 'package:testing_app/features/home/domain/usecase/home_usecases.dart';
import 'package:testing_app/features/home/presentation/bloc/home_events.dart';
import 'package:testing_app/features/home/presentation/bloc/home_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final HomeUseCase homeUseCase;
  HomeBloc({required this.homeUseCase}) : super(HomeIntialState()) {
    on<GetHomeDataEvent>((event, emit) async {
      emit(GetDataLoadingState());
      emit((await homeUseCase.call()).fold((left) => GetDataFailureState(),
          (data) => GetDataSuccessState(data: data)));
    });
  }
}
