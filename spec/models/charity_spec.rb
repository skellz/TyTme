require 'spec_helper'
require 'pry'

describe Charity do
  it { should have_and_belong_to_many(:users) }
  it { should have_many(:items).through(:wishlist) }

  it { should have_valid(:name).when('Charity Org', 'Charity', 'Good4u') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:email).when('charity@char.org') }
  it { should_not have_valid(:email).when(nil, 'c@.org', 'char@org', '@char.org') }

  it { should have_valid(:address).when('123 Main st', '22-1 Main Blvd.', '44 wood rd suite 5') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:city).when('Boston', 'New York') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('NY', 'MA') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip_code).when('11222', '02144') }
  it { should_not have_valid(:zip_code).when(nil, '') }


  it { should have_valid(:country).when('United States') }
  it { should_not have_valid(:country).when(nil, '') }

  describe 'uniqueness validations' do 
    before(:each) do 
      FactoryGirl.build(:charity)
    end
      it { should validate_uniqueness_of :email }
      it { should validate_uniqueness_of :name }
  end
end
