require 'test_helper'

class GuessesTest < ActionDispatch::IntegrationTest
  test "can see the main page" do
   get "/"
   assert_select "h1", "Are you a Dog or Cat Person?"
 end
end
