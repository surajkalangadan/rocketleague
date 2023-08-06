

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled3/repositry/modelclass/rocket.dart';

import '../repositry/api/rocket_api.dart';

part 'rocket_event.dart';
part 'rocket_state.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {
  late Rocketmodel rocketmodel;
  Rocketapi rocketapi=Rocketapi();
  RocketBloc() : super(RocketInitial()) {

    on<RocketEvent>((event, emit)async {
      emit(RocketLoading());
      try{

        rocketmodel = await rocketapi.getRocketmodel();
        emit(RocketLoaded());
      } catch(e){
        print(e);
        emit(RocketError());}
    });

  }
}
