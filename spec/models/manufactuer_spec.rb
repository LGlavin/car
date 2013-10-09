require 'spec_helper'

describe Manufactuer do

  it {should have_valid(:name).when('Honda') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:country).when('Japan') }
  it { should_not have_valid(:country).when(nil, '') }
end
