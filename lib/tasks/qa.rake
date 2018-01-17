namespace :qa do
  unless Rails.env == 'production'
    require 'rspec/core/rake_task'
    require 'rubocop/rake_task'
    require 'reek/rake/task'

    desc 'Execute Rspec'
    RSpec::Core::RakeTask.new(:spec) do |task|
      task.rspec_opts = '--format p'
    end

    desc 'Execute rubocop -DR'
    RuboCop::RakeTask.new(:rubocop) do |task|
      task.options = ['-DR'] # Rails, display cop name
    end

    desc 'Execute reek'
    Reek::Rake::Task.new do |task|
      task.config_file   = 'config/config.reek'
      task.source_files = '{app/**/*.rb,lib/**/*.rb,lib/tasks/*.rake,config/**/*.rb}'
    end

    desc 'Execute haml-lint'
    task haml_lint: :environment do
      puts 'HAML-LINT'
      puts %x(haml-lint .)
    end

    desc 'Execute rails_best_practices'
    task rbp: :environment do
      require 'rails_best_practices'
      analyzer = RailsBestPractices::Analyzer.new('.')
      analyzer.analyze
      puts analyzer.output
    end
  end
end

task :qa do
  %w(rubocop reek rbp spec).each do |task|
    Rake::Task["qa:#{task}"].invoke
  end
end