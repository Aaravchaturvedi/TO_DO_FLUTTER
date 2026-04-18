String formatDateTime(DateTime dateTime) {
  return "${dateTime.day}/${dateTime.month}/${dateTime.year} "
         "${dateTime.hour}:${dateTime.minute}";
}

bool isToday(DateTime dt) {
  final now = DateTime.now();
  return dt.year == now.year &&
      dt.month == now.month &&
      dt.day == now.day;
}

bool isUpcoming(DateTime dt) {
  final now = DateTime.now();

  final todayDate = DateTime(now.year, now.month, now.day);
  final taskDate = DateTime(dt.year, dt.month, dt.day);

  return taskDate.isAfter(todayDate); // ✅ FIXED
}