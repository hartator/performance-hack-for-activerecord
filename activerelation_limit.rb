class RelationWithLimit < ActiveRecord::Relation
  def [] selector
    case selector
    when Integer
      self.offset(selector).limit(1)
    when Range
      unless selector.last == -1
        self.offset(selector.to_a[0]).limit(selector.to_a.size)
      else
        self.offset(selector.first).limit(1000)
      end
    end
  end
end

class ActiveRecord::Base
  private 
    def self.relation #:nodoc:
      @relation ||= RelationWithLimit.new(self, arel_table)
      finder_needs_type_condition? ? @relation.where(type_condition) : @relation
    end
end