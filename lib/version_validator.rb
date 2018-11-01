class VersionValidator
  def self.validate_format value
    fail "Version '#{value}' is invalid. Specify a valid version." unless value =~ /\d+\.\d+\.\d+/
  end
end