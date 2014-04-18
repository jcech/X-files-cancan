require 'spec_helper'

describe Role do
  it { should have_many :users }
  it { should have_many :assignments }
end
