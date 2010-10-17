module Rawstats
  class ConfigFile
    def self.setup
      new.run
    end

    def run
      File.open(config_file, "w") do |file|
        rendered_config_file = ERB.new(File.read("#{config_file}.erb"), 0).result(binding)
        file.puts(rendered_config_file)
      end
    end

    def data_directory
      ENV['RAWSTATS_DATA_DIR'] || "/home/atmos/rawstats/local-data"
    end

    def log_file_command
      ENV['RAWSTATS_LOG_COMMAND'] || "gzip -c -d /home/atmos/rawstats/logs/*log.*.gz |"
    end

    def config_file
      File.join(File.dirname(__FILE__), '..', 'public', 'cgi-bin', 'awstats.conf')
    end
  end
end
