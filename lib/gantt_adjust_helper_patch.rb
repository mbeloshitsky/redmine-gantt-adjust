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
		    last4months = Date.today - 30*4
		    options[:year]  ||= last4months.year
		    options[:month] ||= last4months.month
		    initialize_without_adjustments(options)
		end
	end
end

Redmine::Helpers::Gantt.send(:include, GanttAdjustHelperPatch)
