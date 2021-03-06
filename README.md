# trumpitter
A Trump Tweet Bot that uses Markov Chains to create fake Trump tweets.

# to-do
- [ ] read in trump's new tweets
- [ ] allow users to vote on the bot's creations
- [ ] add highest upvoted bot generated tweets to the markov model
- [ ] add a statistics page for most liked/favorited/retweeted

# local setup
In order to set up trumpitter on your local machine, you will need ruby, and postgresql to be installed on your local machine.

### windows
1. First install ruby using the ruby installer - https://rubyinstaller.org/
2. Next install the rails gem using `gem install rails` in your ruby terminal
3. Then install postgresql from https://www.postgresql.org/download/
4. You will need a tool to setup your local postgres servers so install pgadmin https://www.pgadmin.org/download/pgadmin-4-windows/
5. Launch pgAdmin and set up your username and password. Make sure you pass this in to ruby via the `database.yml` file so that you are able to use your local server.
6. Follow the steps in the [all](#all) section.

### macOS
1. First install ruby using homebrew with `brew install ruby`
2. Next install postgresql with `brew install postgres`
3. Install the rails gem with `gem install rails`
4. Launch the postgres server with `brew services start postgres`
5. Follow the steps in the [all](#all) section.

### All
1. Install the required gems with `bundle install`
2. Create the development database with `rake db:create` and then `rake db:schema:load`
3. Create the `config/secrets.yml` file
4. Run `rake secret` to generate a new secret and then place it in your `secrets.yml` file as follows:
    ```ruby
    development:
        secret_key_base: [YOUR GENERATED SECRET HERE]
    ```
5. Finally you can launch the local server with `rails server` (or `ruby bin/rails server` on windows) and navigate to http://localhost:3000 to view the application.


# contributors
Ishan Khatri - ishan@khatri.io

Jasmine Lee - leejas2017@gmail.com 

Will Morgus - wmorgus@seas.upenn.edu

Nigel Paine - nigelspaine@gmail.com
