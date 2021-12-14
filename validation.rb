module Validation
  def validate(obj, validate_type, param = nil)
    case validate_type.to_s
    when 'presence'
      return true if obj != nil && obj != ''
    when 'format'
      return true if obj == param
    when 'type'
      return true if obj.class.to_s == param.to_s
    end
    false
  end

  def validate!
    validate(nil, nil, nil)
  end

  def valid?
    false
  end
end