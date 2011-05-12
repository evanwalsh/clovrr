require 'spec_helper'

describe Session do
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }

end