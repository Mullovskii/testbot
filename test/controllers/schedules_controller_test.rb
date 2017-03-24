require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_url
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post schedules_url, params: { schedule: { bot_id: @schedule.bot_id, friday: @schedule.friday, lesson_id: @schedule.lesson_id, monday: @schedule.monday, remind_over: @schedule.remind_over, repeat: @schedule.repeat, repeat_daily: @schedule.repeat_daily, saturday: @schedule.saturday, sunday: @schedule.sunday, thursday: @schedule.thursday, time: @schedule.time, tuesday: @schedule.tuesday, wednesday: @schedule.wednesday } }
    end

    assert_redirected_to schedule_url(Schedule.last)
  end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_url(@schedule)
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { bot_id: @schedule.bot_id, friday: @schedule.friday, lesson_id: @schedule.lesson_id, monday: @schedule.monday, remind_over: @schedule.remind_over, repeat: @schedule.repeat, repeat_daily: @schedule.repeat_daily, saturday: @schedule.saturday, sunday: @schedule.sunday, thursday: @schedule.thursday, time: @schedule.time, tuesday: @schedule.tuesday, wednesday: @schedule.wednesday } }
    assert_redirected_to schedule_url(@schedule)
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete schedule_url(@schedule)
    end

    assert_redirected_to schedules_url
  end
end
