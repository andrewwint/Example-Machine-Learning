require 'test_helper'

class GuessesControllerTest < ActionDispatch::IntegrationTest

  test "can see the main page" do
   get "/"
   assert_select "h1", "Are you a Dog or Cat Person?"
  end

  test "can see the form" do
   get "/"
   assert_select "form", true, "From is missing"
  end

  test "can see the dropdown" do
   get "/"
   assert_select "select", true, "Height dropdown missing"
  end

  test "can see the input numer field" do
   get "/"
   assert_select "input[type=number][name='guess[weight]']", true, "Input weight field missing"
  end

  test "can see the 'Guess' button" do
   get "/"
   assert_select "a[type=button][id='guess']", true, "Guess button is missing"
  end

  test "can see the chart canvas " do
   get "/"
   assert_select "canvas", true, "Canvas tag is missing"
  end

end
