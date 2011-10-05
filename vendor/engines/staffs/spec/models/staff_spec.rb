require 'spec_helper'

describe Staff do

  def reset_staff(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @staff.destroy! if @staff
    @staff = Staff.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_staff
  end

  context "validations" do
    
    it "rejects empty name" do
      Staff.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_staff
      Staff.new(@valid_attributes).should_not be_valid
    end
    
  end

end