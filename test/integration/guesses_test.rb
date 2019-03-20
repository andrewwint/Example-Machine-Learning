require 'test_helper'
require 'csv'
require 'application_system_test_case'

class Guess::CreateTest < ApplicationSystemTestCase

  test "load csv file" do
    # visit "/"
    CSV.foreach('test/fixtures/files/AnimalHeightWeight.csv', headers: true, header_converters: :symbol) do |row|
      # visit "/"
      # puts row[0]
      # puts row[1]
      # puts row[2]
    end
  end

end

class GuessesTest < ActionDispatch::IntegrationTest

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
