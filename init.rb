require 'redmine'
require_dependency 'changeset_patch'

Redmine::Plugin.register :redmine_redmine_diff_email do
  name 'Redmine Redmine Diff Email plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
end

ProjectCustomField.find_by_name("Send Diff Emails") ||
  ProjectCustomField.create(:name => "Send Diff Emails", 
                            :field_format => "bool",
                            :is_required => true,
                            :is_for_all => false,
                            :default_value => nil
                            )