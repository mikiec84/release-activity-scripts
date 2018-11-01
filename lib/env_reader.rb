class Env
  def self.get name
    value = ENV[name].to_s.strip
    return value unless value.to_s.empty?
    return nil
  end

  def self.get_or_error name
    value = get name
    fail "Please specify environment variable '#{name}'." if value == nil || value == ''
    value
  end
end