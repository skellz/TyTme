require 'spec_helper'

describe User do
  it { should have_and_belong_to_many(:charities) }

  it { should have_valid(:first_name).when('Mike', 'Bill', 'John') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:email).when('charity@char.org') }
  it { should_not have_valid(:email).when(nil, 'c@.org', 'char@org', '@char.org') }

  it { should have_valid(:last_name).when('Doe', 'Will', 'Smith') }
  it { should_not have_valid(:last_name).when(nil, '') }
  
  describe 'uniqueness validations' do 
    before(:each) do 
      FactoryGirl.create(:user)
    end
      it { should validate_uniqueness_of :email }
  end
end
