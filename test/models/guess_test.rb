# == Schema Information
#
# Table name: guesses
#
#  id         :integer          not null, primary key
#  pet_guess  :string
#  height     :float
#  weight     :float
#  is_correct     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GuessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
