require 'support/active_record'
require 'active_record'
require_relative '../../app/controllers/application_controller'
require_relative '../../app/controllers/advisor_controller'
require_relative '../../app/controllers/sessions_controller'
require_relative '../../app/helpers/sessions_helper'
require_relative '../../app/models/advisor_user'


RSpec.describe AdvisorController, "#generateTeamCode" do
  context "advisor controller while creating a new team" do
    it "generates team code " do
      @advisor_users = AdvisorUser.new(username: "advisor@domain.com",
                                       password: "password",
                                       first_name: "Jake", last_name: "Wier",
                                       school_name: "Brooks Wester Middle School",
                                       school_level: "Middle",
                                       pay_code: "Y1234")

      @advisor_controller = AdvisorController.new
      teamCode1 = @advisor_controller.genTeamCode(@advisor_users.id)
      teamCode2 = @advisor_controller.genTeamCode(@advisor_users.id)
      expect(teamCode1)!= teamCode2
    end
  end
end

