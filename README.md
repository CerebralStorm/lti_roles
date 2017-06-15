# LTIRoles

This is a small gem that maps the LTI standard roles into a ruby symbol. I created this for use with cancancan.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lti_roles'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lti_roles

## Usage

LTIRoles has a RoleManager class that simply you initialize by passing your launch params roles string. RoleManager expects your roles to include the full URN. See [this page](https://www.imsglobal.org/specs/ltiv1p0/implementation-guide#toc-16) for a list of possible roles.

Example:
```ruby
  roles = LTIRoles::RoleManager.new('urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User')

  roles.institution_roles
  => [:instructor, :student]
```

## Usage with CanCanCan

Inside your launch controller you might save off the launch roles.

```ruby
  current_user.roles = LTIRoles::RoleManager.new('urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User')

```

Then you can check abilities like so.

```ruby
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    user.roles ||= []

    if user.roles.institution_roles.include?(:administrator)
      can :manage, :all
    end

    if user.roles.institution_roles.include?(:instructor)
      can :read, :all
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CerebralStorm/lti_roles.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
