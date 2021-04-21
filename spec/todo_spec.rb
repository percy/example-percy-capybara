RSpec.describe 'TodoMVC example', type: :feature do
  before(:each) do
    visit 'http://localhost:3003/index.html'
  end

  it 'renders the todo app' do
    expect(page.has_selector?('.new-todo')).to be true
    page.percy_snapshot('Empty Todo State')
  end

  it 'makes a todo' do
    expect(page.has_selector?('.new-todo')).to be true

    find(".new-todo").set("Try Percy")
    find(".new-todo").native.send_keys(:return)

    expect(page.has_selector?('.todo-list li')).to be true
    page.percy_snapshot('With a Todo')
  end

  it 'completes a todo' do
    expect(page.has_selector?('.new-todo')).to be true

    find(".new-todo").set("Try Percy")
    find(".new-todo").native.send_keys(:return)

    expect(page.has_selector?('.todo-list li')).to be true

    find(".toggle", visible: false).click

    expect(page.has_selector?('.completed')).to be true
    page.percy_snapshot('Completed Todo')
  end
end
