require_dependency 'issue'

module GanttAdjustHelperPatch
	def self.included(base)
		base.send(:include, InstanceMethods)

		base.class_eval do
			alias_method_chain :initialize, :adjustments
		end
	end

	module InstanceMethods
		def initialize_with_adjustments(options={})
            start_offset = Setting.plugin_gantt_adjust["start_offset"].to_i
            window_size = Setting.plugin_gantt_adjust["window_size"].to_i
		    last4months = Date.today + 30*(start_offset || 0)
		    options[:year]  ||= last4months.year
		    options[:month] ||= last4months.month
            options[:months] = window_size
		    initialize_without_adjustments(options)
		end
	end
end

Redmine::Helpers::Gantt.send(:include, GanttAdjustHelperPatch)
