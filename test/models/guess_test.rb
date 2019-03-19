# == Schema Information
#
# Table name: guesses
#
#  id         :integer          not null, primary key
#  pet        :string
#  height     :float
#  weight     :float
#  answer     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GuessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
