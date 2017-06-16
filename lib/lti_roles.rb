require "lti_roles/version"
require 'active_support/inflector'

module LTIRoles
  ContextTypeURN = 'urn:lti:context-type:ims/lis/'.freeze
  SystemRoleURN = 'urn:lti:sysrole:ims/lis/'.freeze
  InstitutionRoleURN = 'urn:lti:instrole:ims/lis/'.freeze
  ContextRoleURN = 'urn:lti:role:ims/lis/'.freeze

  class RoleManager
    attr_accessor :roles, :context_types, :system_roles, :institution_roles, :context_roles, :other_roles

    def initialize(roles = '')
      @roles = roles
      @context_types = []
      @system_roles = []
      @institution_roles = []
      @context_roles = []
      @other_roles = []
      map_roles
    end

    def map_roles
      roles.split(',').each do |role|
        case
        when role.downcase.include?(ContextTypeURN)
          context_types << clean_role(ContextTypeURN, role)
        when role.downcase.include?(SystemRoleURN)
          system_roles << clean_role(SystemRoleURN, role)
        when role.downcase.include?(InstitutionRoleURN)
          institution_roles << clean_role(InstitutionRoleURN, role)
        when role.downcase.include?(ContextRoleURN)
          context_roles << clean_role(ContextRoleURN, role)
        else
          other_roles << role
        end
      end
    end

    def clean_role(urn_prefix, role)
      role.gsub(/#{Regexp.quote(urn_prefix)}/i, '').gsub('/', '').underscore
    end

    def to_h
      {
        'roles' => roles,
        'context_type' => context_types,
        'system_roles' => system_roles,
        'institution_roles' => institution_roles,
        'context_roles' => context_roles
      }
    end

  end
end
