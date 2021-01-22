import './year_month.dart';

class MonthlyMaster {
  static List<YearMonth> _items = [
    YearMonth(year: 2019, month: 11),
    YearMonth(year: 2019, month: 12),
    YearMonth(year: 2020, month: 1),
    YearMonth(year: 2020, month: 2),
    YearMonth(year: 2020, month: 3),
    YearMonth(year: 2020, month: 4),
    YearMonth(year: 2020, month: 5),
    YearMonth(year: 2020, month: 6),
    YearMonth(year: 2020, month: 7),
    YearMonth(year: 2020, month: 8),
    YearMonth(year: 2020, month: 9),
    YearMonth(year: 2020, month: 10),
    YearMonth(year: 2020, month: 11),
    YearMonth(year: 2020, month: 12),
  ];

  static List<YearMonth> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }
}
