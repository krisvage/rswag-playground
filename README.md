# README

A Rails 8 playground for showing [rswag](https://github.com/rswag/rswag)

Commands used to create scaffold for project:

```bash
rails new rswag-playground --api-only --skip-test --skip-system-test --edge --devcontainer
bundle add rspec-rails
bundle binstubs rspec-core
bin/rails generate rspec:install
bundle add rswag
bin/rails generate authentication --api
bundle add blazer
bin/rails generate blazer:install
bin/rails generate scaffold Post title:string content:text user:references
bin/rails db:migrate
bin/rails generate rspec:swagger PostsController
```
