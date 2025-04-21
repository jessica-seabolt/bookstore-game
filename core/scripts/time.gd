extends Timer

signal make_customer_signal
signal update_time(time: String)

# Constants for time thresholds
const MINUTES_PER_HOUR = 60
const HOURS_PER_DAY = 24  # 24-hour format
const DAYS_PER_WEEK = 7
const WEEKS_PER_MONTH = 4
const MONTHS_PER_YEAR = 12
const QUARTERS_PER_YEAR = 4
const CUSTOMER_INTERVAL = 10  # Every 10 minutes

# Start and end hour settings, modified by the player
var open_hour = BookstoreData.get_open_hour()
var open_minutes = BookstoreData.get_open_minutes()
var close_hour = BookstoreData.get_close_hour()
var close_minutes = BookstoreData.get_close_minutes()

# Time Variables
var minutes = open_minutes
var hour = open_hour # 24h format
var day = 1
var week = 1
var month = 1
var quarter = 1
var year = 1

# Timer timeout handler
func _on_in_game_time_timer_timeout() -> void:
    increment_minutes()
    
    # Check if it's time to make a customer
    if minutes % CUSTOMER_INTERVAL == 0:
        make_customer_signal.emit()
    
    update_time.emit(format_current_time())

# Increment minutes and handle rollovers
func increment_minutes() -> void:
    minutes += 1
    if minutes >= MINUTES_PER_HOUR:
        minutes = 0
        increment_hour()

# Increment hours and handle rollovers
func increment_hour() -> void:
    hour += 1
    
    # If the end hour is hit, reset to the start hour and increment the day
    if hour == close_hour && minutes == close_minutes:
        hour = open_hour
        minutes = open_minutes
        
         # Increment day if store closes before midnight
        if close_hour >= open_hour:
            increment_day()
            
    # Increment day if store is open past midnight
    elif hour >= HOURS_PER_DAY:
        hour = 0
        increment_day()

# Increment days and handle rollovers
func increment_day() -> void:
    day += 1
    if day > DAYS_PER_WEEK:
        day = 1
        increment_week()

# Increment weeks and handle rollovers
func increment_week() -> void:
    week += 1
    if week > WEEKS_PER_MONTH:
        week = 1
        increment_month()

# Increment months and handle rollovers
func increment_month() -> void:
    month += 1
    if month > MONTHS_PER_YEAR:
        month = 1
        increment_year()
    update_quarter() 

# Update quarter based on the current month
func update_quarter() -> void:
    quarter = ((month - 1).div(3)) + 1 # div makes GDScript shut up lol
    if quarter > QUARTERS_PER_YEAR:
        quarter = 1

# Increment year
func increment_year() -> void:
    year += 1

# Print the current game time
func format_current_time() -> String:
    return(str(hour).pad_zeros(2) + ":" + str(minutes).pad_zeros(2) +
          " on D" + str(day) +
          " W" + str(week) +
          " M" + str(month) +
          " Q" + str(quarter) +
          " Y" + str(year))
