require 'spec_helper'

describe Automobile do
  it { should have_valid(:color).when('Red') }
  it { should_not have_valid(:color).when(nil,'')}

  it { should have_valid(:year).when(1984) }
  it { should_not have_valid(:year).when(nil,'') }

  it { should have_valid(:mileage).when(243,000) }
  it { should_not have_valid(:mileage).when(nil,'') }

  

end
