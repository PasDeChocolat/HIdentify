require 'json'

module ContributionParser

  def hash_contributions data_file
    JSON.parse(File.read(data_file));
  end

  def import_contributions data_file
    hash_contributions(data_file).each do |contrib|
      Contribution.create_with_raw contrib
    end
  end

  # def hash_schedule data_file
  #   JSON.parse(File.read(data_file));
  # end

  # def load_bell_cycle_periods_times(bell_name, cycle_name, period_names, times)
  #   period_names.each_with_index do |period_name, i|
  #     string_start_time = times[i][:start]
  #     string_end_time   = times[i][:end]
  #     BellCyclePeriod.find_or_create_by_bell_cycle_period_times(bell_name, cycle_name, period_name, string_start_time, string_end_time)
  #   end
  # end

  # def load_basic_periods
  #   bell_name = BELL_BASIC
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:34"},
  #             {start: "08:39", end: "09:23"},
  #             {start: "09:28", end: "10:12"},
  #             {start: "10:17", end: "11:01"},
  #             {start: "11:06", end: "11:50"},
  #             {start: "11:50", end: "12:33"},
  #             {start: "12:38", end: "13:22"},
  #             {start: "13:27", end: "14:11"},
  #             {start: "14:16", end: "15:00"}]

  #   # BASIC - CYCLE 1
  #   cycle_name = CYCLE_1
  #   periods = [PERIOD_HOME_ROOM,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_7,
  #               PERIOD_8]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # BASIC - CYCLE 7
  #   cycle_name = CYCLE_7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,    
  #               PERIOD_3,    
  #               PERIOD_4]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # BASIC - CYCLE 3
  #   cycle_name = CYCLE_3
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,    
  #               PERIOD_1,
  #               PERIOD_2]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)
  # end

  # def load_chapel_periods
  #   bell_name = BELL_CHAPEL
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:09"},
  #             {start: "08:14", end: "08:55"},
  #             {start: "09:00", end: "09:41"},
  #             {start: "09:46", end: "10:27"},
  #             {start: "10:32", end: "11:13"},
  #             {start: "11:18", end: "11:59"},
  #             {start: "11:59", end: "12:42"},
  #             {start: "12:47", end: "13:28"},
  #             {start: "13:33", end: "14:14"},
  #             {start: "14:19", end: "15:00"}]

  #   # CHAPEL - CYCLE 1
  #   cycle_name = CYCLE_1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_7,
  #               PERIOD_8]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # CHAPEL - CYCLE 7
  #   cycle_name = CYCLE_7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_3,
  #               PERIOD_4]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # CHAPEL - CYCLE 3
  #   cycle_name = CYCLE_3
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_1,
  #               PERIOD_2]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)
  # end

  # def load_extended_periods
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:10"},
  #             {start: "08:15", end: "09:25"},
  #             {start: "09:30", end: "10:40"},
  #             {start: "10:45", end: "11:40"},
  #             {start: "11:45", end: "12:30"},
  #             {start: "12:35", end: "13:45"},
  #             {start: "13:50", end: "15:00"}]
    
  #   # Extended 1:1357 - CYCLE 1
  #   cycle_name = CYCLE_1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_1,
  #               PERIOD_3,
  #               PERIOD_MEETING,
  #               PERIOD_LUNCH,
  #               PERIOD_5,
  #               PERIOD_7]
  #   load_bell_cycle_periods_times(BELL_EXTENDED_1_1357, cycle_name, periods, times)

  #   # Extended 1:2468 - CYCLE 1
  #   cycle_name = CYCLE_1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_2,
  #               PERIOD_4,
  #               PERIOD_MEETING,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_8]
  #   load_bell_cycle_periods_times(BELL_EXTENDED_1_2468, cycle_name, periods, times)

  #   # Extended 2:7153 - CYCLE 7
  #   cycle_name = CYCLE_7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_7,
  #               PERIOD_1,
  #               PERIOD_MEETING,
  #               PERIOD_LUNCH,
  #               PERIOD_5,
  #               PERIOD_3]
  #   load_bell_cycle_periods_times(BELL_EXTENDED_2_7153, cycle_name, periods, times)

  #   # Extended 2:8264 - CYCLE 7
  #   cycle_name = CYCLE_7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_8,
  #               PERIOD_2,
  #               PERIOD_MEETING,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_4]
  #   load_bell_cycle_periods_times(BELL_EXTENDED_2_8264, cycle_name, periods, times)

  #   # Extended 3:3751 - CYCLE 3
  #   cycle_name = CYCLE_3
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_3,
  #               PERIOD_7,
  #               PERIOD_MEETING,
  #               PERIOD_LUNCH,
  #               PERIOD_5,
  #               PERIOD_1]
  #   load_bell_cycle_periods_times(BELL_EXTENDED_3_3751, cycle_name, periods, times)

  #   # Extended 3:4862 - CYCLE 3
  #   cycle_name = CYCLE_3
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CHAPEL,
  #               PERIOD_4,
  #               PERIOD_8,
  #               PERIOD_MEETING,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_2]
  #   load_bell_cycle_periods_times(BELL_EXTENDED_3_4862, cycle_name, periods, times)
  # end

  # def load_assembly1_periods
  #   bell_name = BELL_ASSEMBLY_1
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:34"},
  #             {start: "08:39", end: "09:18"},
  #             {start: "09:23", end: "10:02"},
  #             {start: "10:07", end: "10:46"},
  #             {start: "10:51", end: "11:30"},
  #             {start: "11:35", end: "12:14"},
  #             {start: "12:14", end: "12:48"},
  #             {start: "12:53", end: "13:32"},
  #             {start: "13:37", end: "14:16"},
  #             {start: "14:21", end: "15:00"}]

  #   # ASSEMBLY 1 - CYCLE 1
  #   cycle_name = CYCLE_1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_7,
  #               PERIOD_8]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # ASSEMBLY 1 - CYCLE 7
  #   cycle_name = CYCLE_7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_3,
  #               PERIOD_4]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # ASSEMBLY 1 - CYCLE 3
  #   cycle_name = CYCLE_3
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_1,
  #               PERIOD_2]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)
  # end

  # def load_assembly2_periods
  #   bell_name = BELL_ASSEMBLY_2
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:29"},
  #             {start: "08:34", end: "09:13"},
  #             {start: "09:18", end: "09:57"},
  #             {start: "10:02", end: "10:41"},
  #             {start: "10:46", end: "11:25"},
  #             {start: "11:30", end: "12:15"},
  #             {start: "12:15", end: "12:48"},
  #             {start: "12:53", end: "13:32"},
  #             {start: "13:37", end: "14:16"},
  #             {start: "14:21", end: "15:00"}]

  #   # ASSEMBLY 2 - CYCLE 1
  #   cycle_name = CYCLE_1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_5,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_7,
  #               PERIOD_8]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # ASSEMBLY 2 - CYCLE 7
  #   cycle_name = CYCLE_7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_5,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_3,
  #               PERIOD_4]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # ASSEMBLY 2 - CYCLE 3
  #   cycle_name = CYCLE_3
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_5,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_1,
  #               PERIOD_2]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)
  # end

  # def load_assembly3_periods
  #   bell_name = BELL_ASSEMBLY_3
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:29"},
  #             {start: "08:34", end: "09:13"},
  #             {start: "09:18", end: "09:57"},
  #             {start: "10:02", end: "10:41"},
  #             {start: "10:46", end: "11:25"},
  #             {start: "11:30", end: "12:09"},
  #             {start: "12:09", end: "12:44"},
  #             {start: "12:49", end: "13:28"},
  #             {start: "13:33", end: "14:12"},
  #             {start: "14:17", end: "15:00"}]

  #   # ASSEMBLY 3 - CYCLE 1
  #   cycle_name = CYCLE_1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_5,
  #               PERIOD_6,
  #               PERIOD_LUNCH,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_ASSEMBLY]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # ASSEMBLY 3 - CYCLE 7
  #   cycle_name = CYCLE_7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_5,
  #               PERIOD_6,
  #               PERIOD_LUNCH,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_ASSEMBLY]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # ASSEMBLY 3 - CYCLE 3
  #   cycle_name = CYCLE_3
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_5,
  #               PERIOD_6,
  #               PERIOD_LUNCH,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_ASSEMBLY]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)
  # end

  # def load_variety_athletic_periods
  #   bell_name = BELL_VARIETY_ATHLETIC_ASSEMBLY
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:26"},
  #             {start: "08:31", end: "09:07"},
  #             {start: "09:12", end: "09:48"},
  #             {start: "09:53", end: "10:29"},
  #             {start: "10:34", end: "11:10"},
  #             {start: "11:15", end: "12:15"},
  #             {start: "12:15", end: "12:57"},
  #             {start: "13:02", end: "13:38"},
  #             {start: "13:43", end: "14:19"},
  #             {start: "14:24", end: "15:00"}]

  #   # VarietyAthletic - CYCLE 1
  #   cycle_name = CYCLE_1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_5,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_7,
  #               PERIOD_8]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # VarietyAthletic - CYCLE 7
  #   cycle_name = CYCLE_7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_5,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_3,
  #               PERIOD_4]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)

  #   # VarietyAthletic - CYCLE 3
  #   cycle_name = CYCLE_3
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_5,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_1,
  #               PERIOD_2]
  #   load_bell_cycle_periods_times(bell_name, cycle_name, periods, times)
  # end

  # def load_convocation_periods
  #   times = [ {start: "07:40", end: "07:50"},
  #             {start: "07:55", end: "08:15"},
  #             {start: "08:20", end: "09:00"},
  #             {start: "09:05", end: "09:45"},
  #             {start: "09:50", end: "10:30"},
  #             {start: "10:35", end: "11:15"},
  #             {start: "11:20", end: "12:00"},
  #             {start: "12:00", end: "12:45"},
  #             {start: "12:50", end: "13:30"},
  #             {start: "13:35", end: "14:15"},
  #             {start: "14:20", end: "15:00"}]

  #   # Convocation - CYCLE 1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CONVOCATION,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_7,
  #               PERIOD_8]
  #   load_bell_cycle_periods_times(BELL_SPECIAL_CONVOCATION, CYCLE_1, periods, times)
  # end

  # def load_fair_periods
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:10"},
  #             {start: "08:15", end: "08:35"},
  #             {start: "08:40", end: "09:00"},
  #             {start: "09:05", end: "09:25"},
  #             {start: "09:35", end: "09:55"},
  #             {start: "10:00", end: "10:20"},
  #             {start: "10:25", end: "10:45"},
  #             {start: "10:50", end: "11:10"}]

  #   # Convocation - CYCLE 1
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_3,
  #               PERIOD_4,
  #               PERIOD_5,
  #               PERIOD_6,
  #               PERIOD_7,
  #               PERIOD_8]
  #   load_bell_cycle_periods_times(BELL_SPECIAL_FAIR_DAY, CYCLE_1, periods, times)
  # end

  # def load_may_day_periods
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:26"},
  #             {start: "08:31", end: "09:07"},
  #             {start: "09:12", end: "10:12"},
  #             {start: "10:17", end: "10:53"},
  #             {start: "10:58", end: "11:34"},
  #             {start: "11:39", end: "12:15"},
  #             {start: "12:15", end: "12:57"},
  #             {start: "13:02", end: "13:38"},
  #             {start: "13:43", end: "14:19"},
  #             {start: "14:24", end: "15:00"}]

  #   # May Day - CYCLE 7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_ASSEMBLY,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_3,
  #               PERIOD_4]
  #   load_bell_cycle_periods_times(BELL_SPECIAL_MAY_DAY, CYCLE_7, periods, times)
  # end

  # def load_moving_up_chapel_periods
  #   times = [ {start: "07:40", end: "07:45"},
  #             {start: "07:50", end: "08:20"},
  #             {start: "08:25", end: "09:05"},
  #             {start: "09:10", end: "09:50"},
  #             {start: "09:55", end: "10:35"},
  #             {start: "10:40", end: "11:20"},
  #             {start: "11:25", end: "12:05"},
  #             {start: "12:05", end: "12:45"},
  #             {start: "12:50", end: "13:30"},
  #             {start: "13:35", end: "14:15"},
  #             {start: "14:20", end: "15:00"}]

  #   # May Day - CYCLE 7
  #   periods = [ PERIOD_HOME_ROOM,
  #               PERIOD_CEREMONY,
  #               PERIOD_7,
  #               PERIOD_8,
  #               PERIOD_1,
  #               PERIOD_2,
  #               PERIOD_5,
  #               PERIOD_LUNCH,
  #               PERIOD_6,
  #               PERIOD_3,
  #               PERIOD_4]
  #   load_bell_cycle_periods_times(BELL_CHAPEL_MOVING_UP, CYCLE_7, periods, times)
  # end

  # def load_overrides_for_periods
  #   # Change bell-cycle for Moving Up Chapel day from
  #   # regular "Chapel" to "Chapel Moving Up".
  #   bell = Bell.find_by_name BELL_CHAPEL_MOVING_UP
  #   cycle = Cycle.find_by_name CYCLE_7
  #   bell_cycle = BellCycle.where(bell: bell, cycle: cycle).first
  #   school_day = SchoolDay.find_by_day(Date.parse('2014-05-22'))
  #   school_day.bell_cycle = bell_cycle
  #   school_day.save
  # end

  # def import_period_times
  #   load_basic_periods
  #   load_chapel_periods
  #   load_extended_periods
  #   load_assembly1_periods
  #   load_assembly2_periods
  #   load_assembly3_periods
  #   load_variety_athletic_periods
  #   load_convocation_periods
  #   load_fair_periods
  #   load_may_day_periods
  #   load_moving_up_chapel_periods

  #   # Overrides
  #   load_overrides_for_periods
  # end

  # def import_school_days data_file
  #   hash_schedule(data_file).each do |day_info|
  #     # {"id"=>1, 
  #     # "day"=>"2013-08-26",
  #     # "cycle"=>1,
  #     # "title"=>"Special Convocation Schedule"}
  #     bell_name = day_info['title']
  #     cycle_name = day_info['cycle'].to_s
  #     string_day = day_info['day']
  #     SchoolDay.find_or_create_by_bell_and_cycle_names_and_day bell_name, cycle_name, string_day
  #   end
  # end
end