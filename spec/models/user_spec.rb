require 'spec_helper'

describe User do
  it "is valid with an email" do
    user = User.new(
      email: 'harry@ga.co'
    )
    expect(user).to be_valid
    # expect(true).to be_true
  end

  it "is invalid without an email" do
    user = User.new
    expect(user).to be_invalid
  end

  it "is invalid without a salt"

  it "is invalid without a fish"

end