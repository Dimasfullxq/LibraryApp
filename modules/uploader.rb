# frozen_string_literal: true

# working with files
module Uploader
  def save(file_name, data)
    file = File.open(file_name, 'w')
    file.write(data.to_yaml)
    file.close
  end

  def load(file_name)
    YAML.load_file(file_name)
  end
end
