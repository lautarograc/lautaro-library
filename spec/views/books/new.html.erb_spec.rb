require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      title: "MyString",
      author: "MyString",
      description: "MyText",
      rating: 1.5,
      read: false
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[author]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[rating]"

      assert_select "input[name=?]", "book[read]"
    end
  end
end
