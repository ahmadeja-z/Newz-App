class AppUrl {
  // Base URL for top headlines from BBC News
  static const String headlineBaseUrl = 'https://newsapi.org/v2/top-headlines';

  // Complete URL for fetching top headlines from BBC News
  static const String bbcHeadline = '$headlineBaseUrl?sources=bbc-news&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String abcHeadline = '$headlineBaseUrl?sources=abc-news&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String alJazeeraHeadline = '$headlineBaseUrl?sources=al-jazeera-english&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String argaamHeadline = '$headlineBaseUrl?sources=argaam&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String aryHeadline = '$headlineBaseUrl?sources=ary-news&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String cbcHeadline = '$headlineBaseUrl?sources=cbs-news&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';

  static const String categoriesBaseUrl='https://newsapi.org/v2/everything';
  static const String businessCategories='$categoriesBaseUrl?q=business&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String entertainmentCategories='$categoriesBaseUrl?q=entertainment&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String generalCategories='$categoriesBaseUrl?q=general&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String healthCategories='$categoriesBaseUrl?q=health&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String scienceCategories='$categoriesBaseUrl?q=science&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String sportsCategories='$categoriesBaseUrl?q=sports&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
  static const String technologyCategories='$categoriesBaseUrl?q=technology&apiKey=dedd044cc79f403eb43b3f0766d3c1cd';
}
