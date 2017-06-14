require "lti_roles/version"

module LTIRoles

  class RoleManager
    attr_accessor :roles, :context_types, :system_roles, :institution_roles, :context_roles

    def initialize(roles)
      @roles = roles
      @context_types = map_roles('urn:lti:context-type:ims/lis/')
      @system_roles = map_roles('urn:lti:sysrole:ims/lis/')
      @institution_roles = map_roles('urn:lti:instrole:ims/lis/')
      @context_roles = map_roles('urn:lti:role:ims/lis/')
    end

    def map_roles(urn_prefix)
      roles.split(',').map do |role|
        next unless role.include?(urn_prefix)
        role.gsub(urn_prefix, '').gsub('/', '_').underscore.to_sym
      end.compact
    end

    def to_h
      {
        context_type: context_types,
        system_roles: system_roles,
        institution_roles: institution_roles,
        context_roles: context_roles
      }
    end

  end
end
