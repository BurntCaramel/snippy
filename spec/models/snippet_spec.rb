require 'rails_helper'

RSpec.describe Snippet, type: :model do
  it 'should allow valid information' do
    snippet = Snippet.new(title: 'html doctype', code: '<!doctype html>')
    expect(snippet).to be_valid

    snippet = Snippet.new(code: 'Blah')
    expect(snippet).to be_valid
  end

  it 'should disallow invalid information' do
    snippet = Snippet.new
    expect(snippet).to_not be_valid

    snippet = Snippet.new(description: 'Blah')
    expect(snippet).to_not be_valid

    snippet = Snippet.new(title: 'Blah')
    expect(snippet).to_not be_valid

    snippet = Snippet.new(title: '', code: '')
    expect(snippet).to_not be_valid
  end
end
