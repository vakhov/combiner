config_path_dev = File.join( File.dirname( __FILE__ ), "../config/settings.dev.yml" )
config_path_prod = File.join( File.dirname( __FILE__ ), "../config/settings.prod.yml" )
config_path_template = File.join( File.dirname( __FILE__ ), "../config/settings.yml.template" )

if File.exist?(config_path_prod)
  $config = YAML::load_file config_path_prod
end

if File.exist?(config_path_dev)
  $config = YAML::load_file config_path_dev
end

if File.exist?(config_path_template)
  $config = YAML::load_file config_path_template
end
