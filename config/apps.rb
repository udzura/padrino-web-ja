=begin

This file mounts each application within the Padrino project to a specific path.
You can mount additional applications using any of these below:

   Padrino.mount("blog").to('/blog')
   Padrino.mount("blog", :app_class => "BlogApp").to('/blog')
   Padrino.mount("blog", :app_file =>  "/path/to/blog/app.rb").to('/blog')

Note that mounted apps by default should be placed into 'apps/app_name'.

=end

Padrino.configure_apps do
  set :sessions, true
  set :session_secret, "7043bc560e73c46f0d5eabedbabd217f9f5277e6935047bb9430296ab7b47a44"
  if production?
    set :delivery_method, :smtp => {
      :address         => 'smtp.lipsiasoft.com',
      :port            => '25',
      :user_name       => 'mailer@lipsiasoft.com',
      :password        => 'mailer!',
      :authentication  => :login # :plain, :login, :cram_md5, no auth by default
    }
  else
    set :delivery_method, :test
  end
end

# Mounts the core application for this project
Padrino.mount("PadrinoWeb").to("/")
Padrino.mount("Admin").to("/admin")
