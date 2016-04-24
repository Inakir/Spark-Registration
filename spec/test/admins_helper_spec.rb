=begin
require 'rails_helper'

RSpec.describe AdminsHelper, :type => :helper do
  describe "#admin_log_in" do
    context "when the user is an admin" do
      it "the admin exists" do
          expect(admin_current_user).to eq(true)
          expect(admin_current_user.usertype).to eq("admin")
      end
    end

    context "The user id is not found" do
        it "returns a nil id" do
            expect(Admin.find_by(id: session[:user_id])).to eql(nil)
        end
    end

    context "The login has a user id but is not an admin" do
      it "rejects the user" do
          expect(admin_current_user.usertype).not_to eq("admin")
      end
    end
  end
=end