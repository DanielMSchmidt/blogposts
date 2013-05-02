My personal rails app template
==============================

At the start of a new projects, there are some task you do each time:

  * Adding gems, which you use everytime (e.g. rspec, capybara, haml, ...)
  * Run different installers for each gem
  * Removing the public/index.html (won't be nessasary anymore in Rails 4)
  * Add a HomeController or something like that
  * Add git remotes (e.g. origin and heroku)
  * Initialize a todo.md with it's default structure

If you find yourself doing some of those tasks for new Rails apps you should concider using an [Application Template](http://edgeguides.rubyonrails.org/rails_application_templates.html).

Rails provides a powerfull API to automate these annoying tasks, which keep you away from getting things done. It provides functions like

  * [gem/gem_group](http://edgeguides.rubyonrails.org/rails_application_templates.html#gem-args): adds gems to gemfile
  * [environment](http://edgeguides.rubyonrails.org/rails_application_templates.html#environment-application-data-nil-options-block): Adds a line to an enviroment
  * [generate](http://edgeguides.rubyonrails.org/rails_application_templates.html#generate-what-args): normal rails generator (scaffold, resource, model, etc)
  * [run](http://edgeguides.rubyonrails.org/rails_application_templates.html#run-command): runs a command in the project directory
  * [rake](http://edgeguides.rubyonrails.org/rails_application_templates.html#rake-command-options): runs a rake task
  * [route](http://edgeguides.rubyonrails.org/rails_application_templates.html#route-routing-code): adds a route to your application
  * [git](http://edgeguides.rubyonrails.org/rails_application_templates.html#git-command): runs a git command
  * many others

For example my Application Template looks like this:

    #Get the path of the application template
    path = File.expand_path File.dirname(__FILE__)

    #Ask me what I want
    root_controller = yes? 'Do I need a root controller?'
    if root_controller
      root_controller_name = ask("What is my root controllers name?").underscore
    end

    #Add git
    git :init

    #remove the index.html
    remove_file 'public/index.html'

    #Add testing stuff
    gem_group :development, :test do
        gem('bullet')

        gem('rspec-rails', '~> 2.0')
        gem('database_cleaner')

        gem('faker')
        gem('factory_girl_rails')
        gem('capybara')
    end

    #Add root controller
    if root_controller
      generate :controller, "#{root_controller_name} index"
      route "root to: '#{root_controller_name}\#index'"
      remove_file "public/index.html"
    end

    #Add some other usefull stuff
    gem('foreman')
    gem('compass-rails', group: :assets)
    gem('haml')

    run "cp #{path}/templates/Procfile Procfile"

    #install bundles so their installers will work
    run "bundle install"

    #initialising testing stuff
    say "I will just initialize your testing stuff"
    generate("rspec:install")

    #create/migrate the database
    rake("db:create")
    rake("db:migrate")
    rake("db:test:prepare")

    # hide secret data from git
    append_file '.gitignore', 'config/database.yml'
    append_file '.gitignore', '.env'
    run 'cp config/database.yml config/example_database.yml'
    run 'touch .env'
    append_file '.env', 'PORT=3000'
    run 'cp .env .env.sample'

    #run initial git commit
    git add: '.', commit: '-m "initial commit"'

    #open project
    run "mate ."

To use this application template every time you start a new rails app, simple add the following to your **~/.railsrc**

    -m ~/Path/to/Template/template.rb