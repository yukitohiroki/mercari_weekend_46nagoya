require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ItemsHelper. For example:
#
# describe ItemsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ItemsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end

require 'devise'	
require File.expand_path("spec/support/controller_macros.rb")	

 RSpec.configure do |config|	
  config.include Devise::TestHelpers, type: :controller	
  config.include ControllerMacros, type: :controller	
end 