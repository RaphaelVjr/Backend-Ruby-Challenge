
# Kendo Movies Job Apply Ruby Backend Challenge

A backend server that allow routes to create, get and destroy: movies, sessions and users. Have sidekiq and redis configured for aside jobs and workers. Allow user to import a csv file and receive that in the database.


## Features

- Routers
- Tests using rspec
- Worker mailer sidekiq
- Csv and payload.json import
- SQLITE database


## Clone repository


```http
git clone https://github.com/RaphaelVjr/frontend.git
```

## Install Guides (Required)

You need to install (Might you need to look for install guide based on your OS):

- [Ruby (Install Guide)] 

  After installed set the respective environment variable for your user on windows:
   - Open the Start menu and search for `Environment Variables`.
   - Click on `Environment Variables` in the dialog that appears.
   - In the `System Variables` section, look for the variable named `Path` and edit it.
   - Add the path to your ruby bin directory (usually located at `C:\Ruby31-x64\bin.`
   - Click `OK` to save the changes.


- [SQLITE3 (Install)]

   After installed set the respective environment variable for your user on windows:
    - Open the Start menu and search for `Environment Variables`.
    - Click on `Environment Variables` in the dialog that appears.
    - In the `System Variables` section, look for the variable named `Path` and edit it.
    - Add the path to your SQLITE directory (usually located at `C:\SQLite.`
    - Click `OK` to save the changes.

- [WSL (Install Guide)]
   Needed to install and run `Redis.`
     

- [Redis (Install Guide)]
   - `You will need Redis to run Sidekiq`.
     - After installed Redis and dependency's you will run `redis-server`
     - And in a WSL bash on your IDE or WSL bash outside, you can run `redis-cli`
     - Configuration to match redis port and server already in repository for `Sidekiq`
        



[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [Ruby (Install Guide)]: <https://www.ruby-lang.org/en/documentation/installation/#rubyinstaller>
   [Redis (Install Guide)]: <https://redis.io/docs/install/install-redis/>
   [SQLITE3 (Install)]: <https://www.sqlite.org/index.html>
   [Ruby]: <https://nodejs.org/en>
   [WSL (Install Guide)]: <https://learn.microsoft.com/en-us/windows/wsl/>

    
## Preparing to run project

After clone the repository, and installed all items. In root where located the GemFile run this to install all dependencies.

```http
bundle install
```


## API Documentation

All the routes and their methods.

```http
  post '/submit_ratings', to: 'ratings#submit'
  get '/users', to: 'users#index'
  post '/movies', to: 'movies#create'
  post '/users',   to: 'users#create'
  post 'import_movies', to: 'movies#import'  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
```



## Running Tests

To run tests in the repository using Rspec you need to:

```bash
  bundle exec rspec
```


## Stacks

**Front-end ([Repo]):** [React], [Kendo UI] (Click to know more).

**Back-end:** [Ruby On Rails], [Redis] and [Sidekiq] (Click to know more).




[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [React]: <https://nodejs.org/en>
   [Kendo UI]: <https://www.telerik.com/kendo-react-ui/components/getting-started/>
   [Repo]: <https://github.com/RaphaelVjr/Frontend-React-Challenge>
   [Ruby On Rails]: <https://rubyonrails.org/>
   [Redis]: <https://redis.io/docs/install/install-redis/>
   [Sidekiq]: <https://github.com/sidekiq/sidekiq/wiki/Getting-Started>
