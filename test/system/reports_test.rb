# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alice_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Repot' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '二日目'
    fill_in '内容', with: '二日目の日報です！'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '二日目'
    assert_text '二日目の日報です！'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集', match: :prefer_exact

    assert_text '初日報'
    assert_text '初日報を書きました！'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: '初日報を書きました！これから頑張ります！'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '初日報'
    assert_text '初日報を書きました！これから頑張ります！'
  end

  test 'destroying a Report' do
    visit reports_url

    assert_text '初日報'

    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text '初日報'
  end
end