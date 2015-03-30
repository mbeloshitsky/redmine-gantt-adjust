require 'redmine'

require 'gantt_adjust_helper_patch'

Redmine::Plugin.register :gantt_adjust do
  name 'Adjust Gantt plugin'
  author 'Michel Beloshitsky'
  description 'Adjust gantt default parameters'
  version '0.2.1'
  url 'http://github.com/mbeloshitsky/gantt_adjust'
  author_url 'http://github.com/mbeloshitsky'

  requires_redmine :version_or_higher => '2.3.0'

  settings :default => {'empty' => true}, :partial => 'settings/gantt_adjustments'
end
