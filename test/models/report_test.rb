# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @report = reports(:alice_report)
  end

  test '#editable?' do
    assert_not @report.editable?(@bob)
    assert @report.editable?(@alice)
  end

  test '#created_on' do
    assert_not_instance_of Date, @report.created_at
    assert_instance_of Date, @report.created_on
  end
end
