require "spec_helper"

RSpec.describe LTIRoles do
  let(:role_manager) { LTIRoles::RoleManager }

  it "has a version number" do
    expect(LTIRoles::VERSION).not_to be nil
  end

  def has_role?(urn, result)
    role_manager.new(urn).send(role_type).include?(result)
  end

  context 'Context Type' do
    let(:role_type) { :context_types }

    it "maps CourseTemplate" do
      expect(has_role?("#{LTIRoles::ContextTypeURN}CourseTemplate", 'course_template')).to eq true
    end

    it "maps CourseOffering" do
      expect(has_role?("#{LTIRoles::ContextTypeURN}CourseOffering", 'course_offering')).to eq true
    end

    it "maps CourseSection" do
      expect(has_role?("#{LTIRoles::ContextTypeURN}CourseSection", 'course_section')).to eq true
    end

    it "maps Group" do
      expect(has_role?("#{LTIRoles::ContextTypeURN}Group", 'group')).to eq true
    end
  end

  context 'System Role' do
    let(:role_type) { :system_roles }

    it "maps SysAdmin" do
      expect(has_role?("#{LTIRoles::SystemRoleURN}SysAdmin", 'sys_admin')).to eq true
    end

    it "maps SysSupport" do
      expect(has_role?("#{LTIRoles::SystemRoleURN}SysSupport", 'sys_support')).to eq true
    end

    it "maps Creator" do
      expect(has_role?("#{LTIRoles::SystemRoleURN}Creator", 'creator')).to eq true
    end

    it "maps User" do
      expect(has_role?("#{LTIRoles::SystemRoleURN}User", 'user')).to eq true
    end

    it "maps Administrator" do
      expect(has_role?("#{LTIRoles::SystemRoleURN}Administrator", 'administrator')).to eq true
    end

    it "maps None" do
      expect(has_role?("#{LTIRoles::SystemRoleURN}None", 'none')).to eq true
    end
  end

  context 'Institution Role' do
    let(:role_type) { :institution_roles }

    it "maps Student" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Student", 'student')).to eq true
    end

    it "maps Faculty" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Faculty", 'faculty')).to eq true
    end

    it "maps Learner" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Learner", 'learner')).to eq true
    end

    it "maps Instructor" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Instructor", 'instructor')).to eq true
    end

    it "maps Mentor" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Mentor", 'mentor')).to eq true
    end

    it "maps Staff" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Staff", 'staff')).to eq true
    end

    it "maps Alumni" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Alumni", 'alumni')).to eq true
    end

    it "maps ProspectiveStudent" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}ProspectiveStudent", 'prospective_student')).to eq true
    end

    it "maps Guest" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Guest", 'guest')).to eq true
    end

    it "maps Other" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Other", 'other')).to eq true
    end

    it "maps Administrator" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Administrator", 'administrator')).to eq true
    end

    it "maps Observer" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}Observer", 'observer')).to eq true
    end

    it "maps None" do
      expect(has_role?("#{LTIRoles::InstitutionRoleURN}None", 'none')).to eq true
    end
  end

  context 'Context Role' do
    let(:role_type) { :context_roles }

    it "maps Learner" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Learner", 'learner')).to eq true
    end

    it "maps Learner/Learner" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Learner/Learner", 'learner_learner')).to eq true
    end

    it "maps Learner/NonCreditLearner" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Learner/NonCreditLearner", 'learner_non_credit_learner')).to eq true
    end

    it "maps Learner/ExternalLearner" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Learner/ExternalLearner", 'learner_external_learner')).to eq true
    end

    it "maps Learner/Instructor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Learner/Instructor", 'learner_instructor')).to eq true
    end

    it "maps Instructor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Instructor", 'instructor')).to eq true
    end

    it "maps Instructor/PrimaryInstructor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Instructor/PrimaryInstructor", 'instructor_primary_instructor')).to eq true
    end

    it "maps Instructor/Lecturer" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Instructor/Lecturer", 'instructor_lecturer')).to eq true
    end

    it "maps Instructor/GuestInstructor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Instructor/GuestInstructor", 'instructor_guest_instructor')).to eq true
    end

    it "maps Instructor/ExternalInstructor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Instructor/ExternalInstructor", 'instructor_external_instructor')).to eq true
    end

    it "maps ContentDeveloper" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}ContentDeveloper", 'content_developer')).to eq true
    end

    it "maps ContentDeveloper/ContentDeveloper" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}ContentDeveloper/ContentDeveloper", 'content_developer_content_developer')).to eq true
    end

    it "maps ContentDeveloper/ContentExpert" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}ContentDeveloper/ContentExpert", 'content_developer_content_expert')).to eq true
    end

    it "maps ContentDeveloper/ExternalContentExpert" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}ContentDeveloper/ExternalContentExpert", 'content_developer_external_content_expert')).to eq true
    end

    it "maps Member" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Member", 'member')).to eq true
    end

    it "maps Member/Member" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Member/Member", 'member_member')).to eq true
    end

    it "maps Manager" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Manager", 'manager')).to eq true
    end

    it "maps Manager/AreaManager" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Manager/AreaManager", 'manager_area_manager')).to eq true
    end

    it "maps Manager/CourseCoordinator" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Manager/CourseCoordinator", 'manager_course_coordinator')).to eq true
    end

    it "maps Manager/Observer" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Manager/Observer", 'manager_observer')).to eq true
    end

    it "maps Manager/ExternalObserver" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Manager/ExternalObserver", 'manager_external_observer')).to eq true
    end

    it "maps Mentor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor", 'mentor')).to eq true
    end

    it "maps Mentor/Mentor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/Mentor", 'mentor_mentor')).to eq true
    end

    it "maps Mentor/Reviewer" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/Reviewer", 'mentor_reviewer')).to eq true
    end

    it "maps Mentor/Advisor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/Advisor", 'mentor_advisor')).to eq true
    end

    it "maps Mentor/Auditor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/Auditor", 'mentor_auditor')).to eq true
    end

    it "maps Mentor/Tutor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/Tutor", 'mentor_tutor')).to eq true
    end

    it "maps Mentor/LearningFacilitator" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/LearningFacilitator", 'mentor_learning_facilitator')).to eq true
    end

    it "maps Mentor/ExternalMentor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/ExternalMentor", 'mentor_external_mentor')).to eq true
    end

    it "maps Mentor/ExternalReviewer" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/ExternalReviewer", 'mentor_external_reviewer')).to eq true
    end

    it "maps Mentor/ExternalAdvisor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/ExternalAdvisor", 'mentor_external_advisor')).to eq true
    end

    it "maps Mentor/ExternalAuditor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/ExternalAuditor", 'mentor_external_auditor')).to eq true
    end

    it "maps Mentor/ExternalTutor" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/ExternalTutor", 'mentor_external_tutor')).to eq true
    end

    it "maps Mentor/ExternalLearningFacilitator" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Mentor/ExternalLearningFacilitator", 'mentor_external_learning_facilitator')).to eq true
    end

    it "maps Administrator" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Administrator", 'administrator')).to eq true
    end

    it "maps Administrator/Administrator" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Administrator/Administrator", 'administrator_administrator')).to eq true
    end

    it "maps Administrator/Support" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Administrator/Support", 'administrator_support')).to eq true
    end

    it "maps Administrator/Developer" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Administrator/Developer", 'administrator_developer')).to eq true
    end

    it "maps Administrator/SystemAdministrator" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Administrator/SystemAdministrator", 'administrator_system_administrator')).to eq true
    end

    it "maps Administrator/ExternalSystemAdministrator" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Administrator/ExternalSystemAdministrator", 'administrator_external_system_administrator')).to eq true
    end

    it "maps Administrator/ExternalDeveloper" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Administrator/ExternalDeveloper", 'administrator_external_developer')).to eq true
    end

    it "maps Administrator/ExternalSupport" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}Administrator/ExternalSupport", 'administrator_external_support')).to eq true
    end

    it "maps TeachingAssistant" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}TeachingAssistant", 'teaching_assistant')).to eq true
    end

    it "maps TeachingAssistant/TeachingAssistant" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}TeachingAssistant/TeachingAssistant", 'teaching_assistant_teaching_assistant')).to eq true
    end

    it "maps TeachingAssistant/TeachingAssistantSection" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}TeachingAssistant/TeachingAssistantSection", 'teaching_assistant_teaching_assistant_section')).to eq true
    end

    it "maps TeachingAssistant/TeachingAssistantSectionAssociation" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}TeachingAssistant/TeachingAssistantSectionAssociation", 'teaching_assistant_teaching_assistant_section_association')).to eq true
    end

    it "maps TeachingAssistant/TeachingAssistantOffering" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}TeachingAssistant/TeachingAssistantOffering", 'teaching_assistant_teaching_assistant_offering')).to eq true
    end

    it "maps TeachingAssistant/" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}TeachingAssistantTemplate", 'teaching_assistant_template')).to eq true
    end

    it "maps TeachingAssistant/TeachingAssistantGroup" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}TeachingAssistant/TeachingAssistantGroup", 'teaching_assistant_teaching_assistant_group')).to eq true
    end

    it "maps TeachingAssistant/Grader" do
      expect(has_role?("#{LTIRoles::ContextRoleURN}TeachingAssistant/Grader", 'teaching_assistant_grader')).to eq true
    end
  end
end


