require 'json'

module StoreData
  def self.store(data:, file_name:)
    path = File.expand_path('../..', __dir__) + "/data/#{file_name.to_s.downcase}"
    if data.any?
      File.write(path, JSON.pretty_generate(data))
    else
      File.write(path, '[]')
    end
  end
end
