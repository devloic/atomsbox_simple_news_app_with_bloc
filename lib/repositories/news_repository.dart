import 'package:atomsbox_simple_news_app_with_bloc/news_data_source/in_memory_news_data_source.dart';
import 'package:news_api_client/news_api_client.dart';

import '../models/article.dart';

class NewsRepository {
  final NewsApiClient _newsApiClient;

  const NewsRepository({required NewsApiClient newsApiClient})
      : _newsApiClient = newsApiClient;

  // Future<Article> getArticleById(String id) async {
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   return Article.articles.where((article) => article.id == id).first;
  // }

  Future<Article?> getArticleById(String id) async {
    /*
    final article = await _newsApiClient.getArticleById(
      id: id,
      objectMapper: Article.fromJson,
    );*/
    final article = await InMemoryNewsDataSource().getArticleById(id: id);
    return article;
  }

  // Future<List<Article>> getPopularArticles() async {
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   return Article.articles.where((article) => article.isPopular).toList();
  // }

  Future<List<Article>> getPopularArticles() async {
    /*
    final articles =
        await _newsApiClient.getPopularArticles(objectMapper: Article.fromJson);*/
    final articles = await InMemoryNewsDataSource().getPopularArticles();
    return articles;
  }

  // Future<List<Article>> getBreakingNewsArticles() async {
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   return Article.articles.where((article) => article.isBreakingNews).toList();
  // }

  Future<List<Article>> getBreakingNewsArticles() async {
    /* final articles = await _newsApiClient.getBreakingNewsArticles(
        objectMapper: Article.fromJson);*/
    final articles = await InMemoryNewsDataSource().getBreakingNewsArticles();

    return articles;
  }

  // Future<List<Article>> getArticlesByCategory(NewsCategory category) async {
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   return Article.articles
  //       .where((article) => article.category == category)
  //       .toList();
  // }

  Future<List<Article>> getArticlesByCategory(NewsCategory category) async {
    /*final articles = await _newsApiClient.getArticlesByCategory(
      newsCategory: category.name,
      objectMapper: Article.fromJson,
    );*/
    final articles = await InMemoryNewsDataSource()
        .getArticlesByCategory(newsCategory: category.name);
    return articles;
  }
}
