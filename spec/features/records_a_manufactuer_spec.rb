require 'spec_helper'

feature 'Record a manufactuer', %Q{
As a car salesperson
I want to record a car manufactuer
So that I can keep track of the types of cars found in the lot
} do
# Acceptance Criteria:

# I must specify a manufacturer name, and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.
  

  scenario 'enters valid information' do
    prev_count = Manufactuer.count
    visit new_manufactuer_path
    fill_in 'Name', with: 'honda'
    fill_in 'Country', with: 'Japan'

    click_button 'Record'
    expect(page).to have_content('Manufactuer was successfully recorded!')
    expect(Manufactuer.count).to eql(prev_count + 1)
  end

  scenario 'does not enter valid information' do
    prev_count = Manufactuer.count
    visit new_automobile_path

    click_button 'Record'
    expect(page).to_not have_content('Manufactuer was successfully recorded!')
  
    expect(Manufactuer.count).to eql(prev_count)
  end

  scenario 'recording car adds association with manufactuer' do
    manufactuer = Manufactuer.new(name: 'Honda', country: 'Japan')
    manufactuer.save!
    prev_count = Automobile.count 
    visit new_automobile_path
    fill_in 'Color', with: 'red'
    fill_in 'Year', with: '1984'
    fill_in 'Mileage', with: '243,000'
    fill_in 'Description', with: 'mint condition'
    fill_in 'Manufactuer', with: manufactuer.id 
    click_button 'Record'

    expect(page).to have_content('Automobile was successfully recorded!')
    expect(Automobile.count).to eql(prev_count + 1)
    expect(Automobile.last.manufactuer_id).to eql(manufactuer.id)
end
  scenario 'deleting a manufactuer deletes associations with automobiles' do
    manufactuer = Manufactuer.new(name: 'Acura', country: 'China')
    manufactuer.save!

    prev_manufactuer_count = Manufactuer.count 
    automobile = Automobile.new(color: 'white', year: '2013', mileage: '23,000',
    description: 'new',
    manufactuer_id: manufactuer.id)
    
    automobile.save!
    
    visit manufactuers_path
  
    click_link 'Delete'
    expect(page).to have_content('Manufactuer was successfully deleted')
    expect(Manufactuer.count).to eql(prev_manufactuer_count - 1)
    prev_manufactuered_automobile = Automobile.where('manufactuer_id = ?', manufactuer.id).last
    expect(prev_manufactuered_automobile).to eql(nil) 
  end
end