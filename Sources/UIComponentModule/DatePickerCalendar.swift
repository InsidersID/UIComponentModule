import SwiftUI

public struct DatePickerCalendar: View {
    @Binding public var startDate: Date?
    @Binding public var endDate: Date?
    public var excludedDateRanges: [(start: Date, end: Date)]
    
    private let calendar = Calendar.current
    @State private var currentMonth: Date = Date()
    private let today: Date = Date()
    @State private var isStartDateSelected: Bool = true
    
    public init(startDate: Binding<Date?> = .constant(nil),
                endDate: Binding<Date?> = .constant(nil),
                excludedDateRanges: [(start: Date, end: Date)] = []) {
        self._startDate = startDate
        self._endDate = endDate
        self.excludedDateRanges = excludedDateRanges
    }
    
    public var body: some View {
        VStack {
            HStack {
                Button {
                    changeMonth(by: -2)
                } label: {
                    Image(systemName: "chevron.left.2")
                }
                
                Button {
                    changeMonth(by: -1)
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Text(monthAndYearString(for: currentMonth))
                    .font(.headline)
                
                Button {
                    changeMonth(by: 1)
                } label: {
                    Image(systemName: "chevron.right")
                }
                
                Button {
                    changeMonth(by: 2)
                } label: {
                    Image(systemName: "chevron.right.2")
                }
            }
            .padding(8)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 16) {
                Text("Mon")
                Text("Tue")
                Text("Wed")
                Text("Thu")
                Text("Fri")
                Text("Sat")
                Text("Sun")
            }
            .padding(8)
            .foregroundStyle(.secondary)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 16) {
                ForEach(generateMonthDays(), id: \.self) { dateInfo in
                    Text(dateInfo.day > 0 ? "\(dateInfo.day)" : "")
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(
                                    dateInfo.isExcluded ? Color.gray.opacity(0.5) :
                                        (dateInfo.isStart || dateInfo.isEnd ? Color.blue :
                                            (dateInfo.isInRange ? Color.blue.opacity(0.3) : Color.clear))
                                )
                        )
                        .foregroundColor(dateInfo.isExcluded ? Color.red :
                                            (dateInfo.isToday ? Color.blue :
                                                (dateInfo.isPast ? Color.gray :
                                                    (dateInfo.isCurrentMonth ? Color.primary : Color.gray.opacity(0.2)))))
                        .cornerRadius(8)
                        .onTapGesture {
                            if !dateInfo.isExcluded &&
                                (dateInfo.isToday || !dateInfo.isPast) &&
                                dateInfo.isCurrentMonth {
                                handleDateSelection(selectedDate: dateInfo.date)
                            }
                        }
                }
            }
            .padding(8)
        }
    }
    
    private func handleDateSelection(selectedDate: Date?) {
        guard let date = selectedDate else { return }
        
        if isStartDateSelected {
            // Check if the selected start date is valid
            if excludedDateRanges.contains(where: { $0.start <= date && date <= $0.end }) {
                print("Start date falls in an excluded range.")
                return
            }
            
            startDate = date
            endDate = nil // Reset the end date for new range
            isStartDateSelected.toggle()
        } else {
            // Check if the selected end date is valid
            if let start = startDate {
                if date < start {
                    print("End date cannot be before the start date.")
                    return
                }
                
                // Check the range from startDate to selected endDate
                let newRange = (start: start, end: date)
                if isRangeExcluded(newRange) {
                    print("Selected date range overlaps with an excluded range.")
                    return
                }
                
                endDate = date
                isStartDateSelected.toggle()
            } else {
                print("Please select a start date first.")
            }
        }
    }
    
    private func isRangeExcluded(_ range: (start: Date, end: Date)) -> Bool {
        excludedDateRanges.contains { excludedRange in
            // Check if the ranges overlap
            !(range.end < excludedRange.start || range.start > excludedRange.end)
        }
    }
    
    private func changeMonth(by offset: Int) {
        if let newMonth = calendar.date(byAdding: .month, value: offset, to: currentMonth) {
            currentMonth = newMonth
        }
    }
    
    private func generateMonthDays() -> [DayInfo] {
        var days: [DayInfo] = []
        
        if let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth)) {
            if let range = calendar.range(of: .day, in: .month, for: firstDayOfMonth) {
                let numberOfDays = range.count
                let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
                let firstWeekdayIndex = (firstWeekday + 5) % 7
                
                for _ in 0..<firstWeekdayIndex {
                    days.append(DayInfo(day: -1, isCurrentMonth: false, isToday: false, isPast: true, date: nil, isInRange: false, isStart: false, isEnd: false, isExcluded: false))
                }
                
                for day in 1...numberOfDays {
                    if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth) {
                        let isToday = calendar.isDate(date, inSameDayAs: today)
                        let isPast = date < today
                        let isInRange = isDateInRange(date: date)
                        let isStart = isStartDate(date)
                        let isEnd = isEndDate(date)
                        let isExcluded = isDateExcluded(date)
                        
                        days.append(DayInfo(day: day, isCurrentMonth: true, isToday: isToday, isPast: isPast, date: date, isInRange: isInRange, isStart: isStart, isEnd: isEnd, isExcluded: isExcluded))
                    }
                }
                
                while days.count < 35 {
                    days.append(DayInfo(day: -1, isCurrentMonth: false, isToday: false, isPast: true, date: nil, isInRange: false, isStart: false, isEnd: false, isExcluded: false))
                }
            }
        }
        
        return days
    }
    
    private func isDateExcluded(_ date: Date) -> Bool {
        excludedDateRanges.contains { range in
            date >= range.start && date <= range.end
        }
    }
    
    private func monthAndYearString(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    private func isDateInRange(date: Date) -> Bool {
        if let start = startDate, let end = endDate {
            return date >= start && date <= end
        }
        return false
    }
    
    private func isStartDate(_ date: Date) -> Bool {
        if let start = startDate {
            return calendar.isDate(date, inSameDayAs: start)
        }
        return false
    }
    
    private func isEndDate(_ date: Date) -> Bool {
        if let end = endDate {
            return calendar.isDate(date, inSameDayAs: end)
        }
        return false
    }
    
}

struct DayInfo: Hashable {
    let day: Int
    let isCurrentMonth: Bool
    let isToday: Bool
    let isPast: Bool
    let date: Date?
    let isInRange: Bool
    let isStart: Bool
    let isEnd: Bool
    let isExcluded: Bool
}

#Preview {
    DatePickerCalendar(
        startDate: .constant(nil),
        endDate: .constant(nil),
        excludedDateRanges: [
            (start: Date(), end: Date().addingTimeInterval(60 * 60 * 24 * 7))
        ]
    )
}
