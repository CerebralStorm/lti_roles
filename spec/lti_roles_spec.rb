require "spec_helper"

RSpec.describe LTIRoles do
  let(:role_manager) { LTIRoles::}
  it "has a version number" do
    expect(LTIRoles::VERSION).not_to be nil
  end

  def has_role?(urn, role_type, result)
    role_manager.new(urn).send(role_type).include?(result)
  end

  context 'System Role' do
    it "maps SysAdmin" do
      expect(has_role?('urn:lti:sysrole:ims/lis/SysAdmin', :system_roles, :sys_admin).to eq true
    end
  end
end
