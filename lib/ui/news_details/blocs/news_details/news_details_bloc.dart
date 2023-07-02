import 'package:atomsbox_simple_news_app_with_bloc/news_data_source/in_memory_news_data_source.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/models.dart';
import '../../../../repositories/repositories.dart';

part 'news_details_event.dart';
part 'news_details_state.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  final NewsRepository _newsRepository;

  NewsDetailsBloc({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const NewsDetailsState()) {
    on<NewsDetailsStarted>(_onNewsDetailsStarted);
  }

  void _onNewsDetailsStarted(
    NewsDetailsStarted event,
    Emitter<NewsDetailsState> emit,
  ) async {
    try {
      // Article article = await _newsRepository.getArticleById(event.articleId);
      Article? article =
          await InMemoryNewsDataSource().getArticleById(id: event.articleId);

      emit(
        state.copyWith(
          article: article,
          status: NewsDetailsStatus.loaded,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: NewsDetailsStatus.error));
    }
  }
}
