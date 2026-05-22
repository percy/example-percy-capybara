# PER-8195 Phase 3 — capybara advanced example.
# Each `it` exercises one row of the Advanced Feature Matrix. See
# ../matrix.yml for the canonical mapping.

require 'spec_helper'

RSpec.describe 'TodoMVC Advanced', type: :feature do
  before(:each) do
    visit "http://localhost:#{Capybara.server_port}/../index.html"
    find('.new-todo').set('Walk the dog')
    find('.new-todo').native.send_keys(:return)
  end

  it 'exercises widths' do
    page.percy_snapshot('TodoMVC Advanced > exercises widths',
                        widths: [375, 768, 1280, 1920])
  end

  it 'exercises percyCSS' do
    page.percy_snapshot('TodoMVC Advanced > exercises percyCSS',
                        percy_css: '.todo-list li { background: #fffde7 !important; }')
  end

  it 'exercises minHeight' do
    page.percy_snapshot('TodoMVC Advanced > exercises minHeight',
                        min_height: 2000)
  end

  it 'exercises enableJavaScript' do
    page.percy_snapshot('TodoMVC Advanced > exercises enableJavaScript',
                        enable_javascript: true)
  end

  it 'exercises responsiveSnapshotCapture' do
    page.percy_snapshot('TodoMVC Advanced > exercises responsiveSnapshotCapture',
                        responsive_snapshot_capture: true,
                        widths: [375, 1280])
  end

  it 'exercises labels' do
    page.percy_snapshot('TodoMVC Advanced > exercises labels',
                        labels: 'smoke,capybara')
  end

  it 'exercises testCase' do
    page.percy_snapshot('TodoMVC Advanced > exercises testCase',
                        test_case: 'todomvc-advanced-suite')
  end

  it 'exercises devicePixelRatio' do
    page.percy_snapshot('TodoMVC Advanced > exercises devicePixelRatio',
                        device_pixel_ratio: 2)
  end

  it 'exercises browsers override' do
    page.percy_snapshot('TodoMVC Advanced > exercises browsers override',
                        browsers: %w[chrome firefox])
  end
end
