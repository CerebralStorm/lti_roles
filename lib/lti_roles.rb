require "lti_roles/version"
require 'active_support/inflector'

module LTIRoles
  ContextTypeURN = 'urn:lti:context-type:ims/lis/'.freeze
  SystemRoleURN = 'urn:lti:sysrole:ims/lis/'.freeze
  InstitutionRoleURN = 'urn:lti:instrole:ims/lis/'.freeze
  ContextRoleURN = 'urn:lti:role:ims/lis/'.freeze

  class RoleManager
    attr_accessor :roles, :context_types, :system_roles, :institution_roles, :context_roles

    def initialize(roles = '')
      @roles = roles
      @context_types = map_roles(ContextTypeURN)
      @system_roles = map_roles(SystemRoleURN)
      @institution_roles = map_roles(InstitutionRoleURN)
      @context_roles = map_roles(ContextRoleURN)
    end

    def map_roles(urn_prefix)
      roles.split(',').map do |role|
        next unless role.include?(urn_prefix)
        role.gsub(urn_prefix, '').gsub('/', '').underscore
      end.compact
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
