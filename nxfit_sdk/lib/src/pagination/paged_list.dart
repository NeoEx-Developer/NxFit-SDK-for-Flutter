
import '../../core.dart';

class PagedList<E> {
  final List<E> items;
  final PaginationRequest? next;
  final PaginationRequest? previous;

  const PagedList(
    this.items, {
    this.next,
    this.previous,
  });

  PagedList.withLinks(this.items, Map<String, String> links)
      : next = _buildRequestFromLinks(_next, _after, links, PaginationRequest.next),
        previous = _buildRequestFromLinks(_prev, _before, links, PaginationRequest.previous);

  static PaginationRequest? _buildRequestFromLinks(String linkKey, String queryKey, Map<String, String> links, PaginationRequest Function(int, String) build) {
    if (!links.containsKey(linkKey)) {
      return null;
    }

    final String link = links[linkKey]!;

    try {
      final params = Uri
          .parse(link)
          .queryParameters;

      if (params.containsKey(queryKey) && params.containsKey(_limit)) {
        final limit = int.parse(params[_limit]!);

        return build(limit, params[queryKey]!);
      }
    } on FormatException {
      print("Invalid URL: $link");
    }
  }

  static const String _next = "next";
  static const String _prev = "prev";
  static const String _after = "after";
  static const String _before = "before";
  static const String _limit = "limit";
}
