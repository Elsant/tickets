require 'rails_helper'

RSpec.describe User, type: :model do

  describe "by registration" do
    context "is valid with valid parameters" do

      it 'is registered' do
        expect(create(:user)).to be_valid
      end

      it 'must have email' do
        expect(subject).to validate_presence_of :email
      end

      it 'must have unique email' do
        is_expected.to validate_uniqueness_of(:email).case_insensitive
      end

      it 'must have password at least 6 characters' do
        expect(subject).to validate_length_of(:password).is_at_least(6)
      end

      it 'must have correct password confirmation' do
        expect(subject).to validate_confirmation_of :password
      end

      it 'must have default user role' do
        expect(subject.role).to eq 'user'
      end
    end

    context "is invalid with wrong parameters" do

      it "is invalid with invalid parameters" do
        expect(build(:invalid_user)).not_to be_valid
      end

      it "is invalid without a email" do
        user = build(:user,email: nil)
        expect(user).not_to be_valid
      end

      it "is invalid without a password" do
        user = build(:user,password: nil)
        expect(user).not_to be_valid
      end

      it "is invalid with a wrong password confirmation" do
        user = build(:user, password_confirmation: "wrong123")
        expect(user).not_to be_valid
      end

    end

    context "has assigned roles" do
       it "has agent role" do
        user = create(:user, role: :agent)
        expect(user.agent?).to be true
      end

      it "has admin role" do
        user = create(:user, role: :admin)
        expect(user.admin?).to be true
      end
    end
  end
end

