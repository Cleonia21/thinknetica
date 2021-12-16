module Validation
  def validate(obj, validate_type, param = nil)
    case validate_type.to_s
    when 'presence'
      return true if !obj.nil? && obj != ''
    when 'format'
      return true unless obj !~ param
    when 'type'
      return true if obj.class.to_s == param.to_s
    end
    false
  end

  def validate!
    i = 0
    until @validation_param[i].nil?
      raise 'bad param' unless validate(@validation_param[i][0], @validation_param[i][1], @validation_param[i][2])

      i += 1
    end
    true
  end

  def valid?
    i = 0
    until @validation_param[i].nil?
      return false unless validate(@validation_param[i][0], @validation_param[i][1], @validation_param[i][2])

      i += 1
    end
    true
  end
end