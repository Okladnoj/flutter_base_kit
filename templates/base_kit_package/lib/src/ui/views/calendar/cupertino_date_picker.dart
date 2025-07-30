import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../../themes/app_theme.dart';
import '../../../themes/extensions/custom_designs.dart';
import '../../../utils/date_time/date_time_parser.dart';
import '../buttons/app_colored_button.dart';
import '../buttons/app_primary_button.dart';

class AppCupertinoDatePicker extends StatefulWidget {
  final DateTime? initialDateTime;
  final DateTime? minDateTime;
  final DateTime? maxDateTime;
  final ValueSetter<DateTime> onChooseDate;
  final bool viewYear;

  const AppCupertinoDatePicker({
    super.key,
    this.initialDateTime,
    this.minDateTime,
    this.maxDateTime,
    required this.onChooseDate,
    this.viewYear = false,
  });

  @override
  State<AppCupertinoDatePicker> createState() => _AppCupertinoDatePickerState();
}

class _AppCupertinoDatePickerState extends State<AppCupertinoDatePicker> {
  CustomDesigns get _designs => context.designs;
  TextTheme get _textTheme => context.textTheme;

  late DateTime _currentDate;

  DateTime _clampDate(DateTime date) {
    if (widget.minDateTime != null && date.isBefore(widget.minDateTime!)) {
      return widget.minDateTime!;
    }
    if (widget.maxDateTime != null && date.isAfter(widget.maxDateTime!)) {
      return widget.maxDateTime!;
    }
    return date;
  }

  final _monthController = FixedExtentScrollController();
  final _dayController = FixedExtentScrollController();

  void _onConfirm() {
    widget.onChooseDate(_currentDate);
    Navigator.of(context, rootNavigator: true).maybePop();
  }

  void _onCancel() {
    Navigator.of(context, rootNavigator: true).maybePop();
  }

  void _animateToInitialItem() {
    _dayController.animateToItem(
      _currentDate.day - 1,
      duration: const Duration(milliseconds: 512),
      curve: Curves.easeInOut,
    );
    _monthController.animateToItem(
      _currentDate.month - 1,
      duration: const Duration(milliseconds: 512),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    _currentDate = _clampDate(widget.initialDateTime ?? DateTime.now());
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _animateToInitialItem(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: _designs.surface,
          border: Border.all(color: _designs.surface),
          borderRadius: BorderRadius.circular(20),
        ),
        height: _heightPicker,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 24),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Expanded(
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    pickerTextStyle: _textTheme.bodyMedium?.copyWith(
                      color: _designs.onSurface,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                child: _buildDateSelector(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppPrimaryButton(
                    onTap: _onConfirm,
                    text: context.strings.confirm,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppColoredButton(
                    onTap: _onCancel,
                    color: _designs.error,
                    colorText: _designs.background,
                    text: context.strings.cancel,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    final year = _currentDate.year;
    final month = _currentDate.month;
    final day = _currentDate.day;

    final maxYearDate = widget.maxDateTime ?? DateTime.now();
    final minYearDate =
        widget.minDateTime ??
        maxYearDate.subtract(const Duration(days: 365 * 120));

    final years = List<DateTime>.generate(
      maxYearDate.year - minYearDate.year + 1,
      (i) => DateTime(minYearDate.year + i),
    );

    final yearController = FixedExtentScrollController(
      initialItem: _currentDate.year - minYearDate.year,
    );

    return Row(
      children: [
        if (widget.viewYear)
          Expanded(
            child: CupertinoPicker(
              itemExtent: _heightItem,
              scrollController: yearController,
              backgroundColor: _designs.surface,
              onSelectedItemChanged: (int index) {
                setState(() {
                  _currentDate = _clampDate(
                    DateTime(minYearDate.year + index, month, day),
                  );
                  _animateToInitialItem();
                });
              },
              children:
                  years
                      .map(
                        (d) => Center(
                          child: Text(
                            DateTimeParser.dateToYearString(d),
                            style: TextStyle(
                              color: _designs.background,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: _heightItem,
            scrollController: _monthController,
            backgroundColor: _designs.surface,
            onSelectedItemChanged: (int index) {
              setState(() {
                _currentDate = _clampDate(
                  DateTime(year, index + 1, _currentDate.day),
                );
                _animateToInitialItem();
              });
            },
            children: List<Widget>.generate(12, (int index) {
              final m = DateTime(year, index + 1, 1);
              return Center(
                child: Text(
                  DateTimeParser.dateToMonthString(m),
                  style: TextStyle(color: _designs.background, fontSize: 16.0),
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: _heightItem,
            scrollController: _dayController,
            backgroundColor: _designs.surface,
            onSelectedItemChanged: (int index) {
              setState(() {
                _currentDate = _clampDate(DateTime(year, month, index + 1));
              });
            },
            children: List<Widget>.generate(
              DateUtils.getDaysInMonth(year, month),
              (int index) {
                final d = DateTime(year, month, index + 1);
                return Center(
                  child: Text(
                    DateTimeParser.dateToDayString(d),
                    style: TextStyle(
                      color: _designs.background,
                      fontSize: 16.0,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  double get _heightPicker => 256;
  double get _heightItem => 34;
}
