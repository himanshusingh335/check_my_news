/// Several categories of News.
enum NewsCategory {
  Trending,
  India,
  Politics,
  ScienceANdTech,
  Sports,
  Business,
  Entertainment,
  Lifestyle,
  World
}


Map<NewsCategory, String> categoryToStringMap = {
  NewsCategory.Trending: "",
  NewsCategory.India: "India",
  NewsCategory.Business: "Business",
  NewsCategory.Entertainment: "Entertainment",
  NewsCategory.Lifestyle: "Lifestyle",
  NewsCategory.Politics: "Politics",
  NewsCategory.ScienceANdTech: "ScienceAndTechnology",
  NewsCategory.Sports: "Sports",
  NewsCategory.World: "World",
};