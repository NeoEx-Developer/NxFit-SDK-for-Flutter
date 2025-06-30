class PaginationRequest {
  final String? afterToken;
  final String? beforeToken;
  final int limit;

  PaginationRequest(this.limit)
      : afterToken = null,
        beforeToken = null;

  PaginationRequest.next(this.limit, this.afterToken) : beforeToken = null;
  PaginationRequest.previous(this.limit, this.beforeToken) : afterToken = null;
}
