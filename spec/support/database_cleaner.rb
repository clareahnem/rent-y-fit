# rspec configurations
# configurations for database cleaner 

RSpec.configure do |config|
    # want to set up truncation cleaning strategy nefore test suite runs
    config.before(:suite) do
        DatabaseCleaner.clean_with(:truncation)
    end

    # =sets transaction stretegy before each test
    # create this because we set transactional_fixtures to false in rails_helper.rb
    # this means that instead of letting rails handle this we want the database cleaner to handle this
    config.before(:each) do 
        DatabaseCleaner.strategy = :transaction
    end

    # want to start the database cleaner gem before each test
    config.before(:each) do
        DatabaseCleaner.start
    end

    # want to do a database clean up after each test
    config.after(:each) do
        DatabaseCleaner.clean
    end
end