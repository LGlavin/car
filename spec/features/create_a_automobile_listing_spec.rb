require 'spec_helper'

feature 'Recording a car listing', %Q{

As a car salesperson
I want to record a newly acquired car
So that I can list it in my lost
} do 


# Acceptance Criteria:

# I must specify the color, year, mileage of the car.
# Only years from 1980 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required format, the car is recorded.
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a building, I am redirected so that I can record another building.

scenario 'enters valid information to record' do
  prev_count = Automobile.count
  visit new_car_url
  fill_in 'Color', with: 'red'
  fill_in 'Year', with: '1984'
  fill_in 'Mileage', with: '243,000'
  fill_in 'Description', with: 'mint condition'

  click_button 'Record'
  expect(page).to have_content('Car was successfully recorded!')
  expect(Automobile.count).to eql(prev_count + 1)
  end
end
