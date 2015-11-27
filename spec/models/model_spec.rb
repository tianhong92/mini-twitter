require "rails_helper"
require "spec_helper"
describe Post do
  it { should belong_to(:user)}
  it { should validate_presence_of(:message) }
  it { should validate_length_of(:message).is_at_least(2).on(:create)}
  it { should validate_length_of(:message).is_at_most(140)}

  # context 'validations' do
  #   it "should have valid factory" do
  #     FactoryGirl.build(:post).should be_valid
  #   end
  #   it "should belong to users" do
  #     should belong_to(:user)
  #   end
  #   it "should require a message" do
  #     FactoryGirl.build(:post, :message => "").should_not be_valid
  #   end
  #   it "message should't be longer than 140 characters" do
  #     FactoryGirl.build(:post, :message => "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678900").should_not be_valid
  #   end
  #   it { expect(build(:post, message: "hahaha")).to be_valid }
  # end
end

describe User do
  it { should have_many(:posts)}
  it { should accept_nested_attributes_for(:posts).allow_destroy(true) }
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email).is_at_least(7).on(:create)}
  it { should validate_length_of(:email).is_at_most(40)}
  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should validate_presence_of(:first_name) }
  it { should validate_length_of(:first_name).is_at_least(2).on(:create)}
  it { should validate_length_of(:first_name).is_at_most(30)}

  it { should validate_presence_of(:last_name) }
  it { should validate_length_of(:last_name).is_at_least(2).on(:create)}
  it { should validate_length_of(:last_name).is_at_most(30)}
  # context 'validations' do
  #   it "should have valid factory" do
  #     FactoryGirl.build(:user).should be_valid
  #   end
  #   # it "should have many messages" do
  #   #   should have(:posts)sho
  #   # end
  #   it "message should't be longer than 140 characters" do
  #     FactoryGirl.build(:post, :message => "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678900").should_not be_valid
  #   end
  #   it { expect(build(:post, message: "hahaha")).to be_valid }
  # end
end