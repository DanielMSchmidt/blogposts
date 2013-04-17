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

My complete Application Template looks like this:

    #Ask me what I want
    root_controller = yes? 'Do I need a root controller?'
    if root_controller
      root_controller_name = ask("What is my root controllers name?").underscore
    end
    heroku = yes? 'Do I need heroku?'

    #Add git
    git :init

    #rm the index.html
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

    environment "config.after_initialize do \n
      Bullet.enable = true \n
      Bullet.alert = true \n
      Bullet.bullet_logger = true \n
      Bullet.console = true \n
      Bullet.rails_logger = true \n
      Bullet.disable_browser_cache = true \n
    end", env: 'development'

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

So my **~/.railsrc** looks like this:

    -m ~/Path/to/Template/template.rb