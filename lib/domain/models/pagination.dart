class Pagination<T> {
  final List<T>? content;
  final int? totalPages;
  final int? totalElements;
  final bool? last;
  final int? number;
  final bool? first;
  final int? numberOfElements;
  final int? size;
  final bool? empty;

  Pagination({
    this.content,
    this.totalPages,
    this.totalElements,
    this.last,
    this.number,
    this.first,
    this.numberOfElements,
    this.size,
    this.empty,
  });

}
