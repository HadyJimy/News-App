abstract class AppStates {}

class IntialState extends AppStates {}

class ChangeBottomNav extends AppStates {}

class NewsLoadingData extends AppStates {}

class NewsGetBusinessSucessData extends AppStates {}

class NewsGetBusinessErrorData extends AppStates {
  final String error;

  NewsGetBusinessErrorData(this.error);
}

class NewsSportsLoadingData extends AppStates {}

class NewsGetSportsSucessData extends AppStates {}

class NewsGetSportsErrorData extends AppStates {
  final String error;

  NewsGetSportsErrorData(this.error);
}

class NewsScienceLoadingData extends AppStates {}

class NewsGetScienceSucessData extends AppStates {}

class NewsGetSceinceErrorData extends AppStates {
  final String error;

  NewsGetSceinceErrorData(this.error);
}
