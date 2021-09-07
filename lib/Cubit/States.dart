abstract class NewsState{}
class NewsInitialState extends NewsState{}
class NewsBottomNavState extends NewsState{}
class NewsGetBusniessSuccessState extends NewsState{}
class NewsGetBusniessErrorState extends NewsState{
   final String error;

  NewsGetBusniessErrorState(this.error);
}
class NewsGetScienceLoadingState extends NewsState{}
class NewsGetScienceSuccessState extends NewsState{}
class NewsGetScienceErrorState extends NewsState{
   final String error;

  NewsGetScienceErrorState(this.error);
}
class NewsGetBusniessLoadingState extends NewsState{}
class NewsGetSportsSuccessState extends NewsState{}
class NewsGetSportsErrorState extends NewsState{
   final String error;

   NewsGetSportsErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsState{}