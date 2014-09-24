class MCollective::Application::Apt<MCollective::Application
  description "Apt application"
  usage "apt [clean|update]"

  def post_option_parser(configuration)
    if ARGV.size == 1
      configuration[:command] = ARGV.shift
    end
  end

  def validate_configuration(configuration)
    raise "\nCommand should be one of: \n * clean\n * update\n" unless configuration[:command] =~ /^clean|update$/

  end

  def main
    mc = rpcclient("apt")

    mc.discover :verbose => true
    mc.send(configuration[:command]).each do |node|
      case configuration[:command]
      when "clean"
        printf("%s\n %s\n\n", node[:sender], node[:data][:output])
      when "update"
        printf("%s\n %s\n\n", node[:sender], node[:data][:output])
      end
    end

    printrpcstats

    mc.disconnect

  end
end
