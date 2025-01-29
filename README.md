# Model Viewer (Ruby)

This applications is meant to run in Docker (Unraid) and mount a folder where you keep your 3D models and images, pdfs, etc. This system can then crawl this folder and import any files in these folders.

From there, these files and folders should be associated (or created) into designs. The goal is to have these designs explorable and downloadable for 3d printing.

Long term, it would be amazing to slice and print from the webapp.

# Feature Todo

- [ ] Allow users to import files
- [ ] Allow files to be assigned to designs (create design from files)

# Development

## Setup

### [asdf](https://mac.install.guide/rubyonrails/7#:~:text=The%20command%20asdf%20list%20ruby%20will%20show%20all%20installed%20versions%20of%20Ruby.&text=To%20override%20the%20default%20version,asdf%20local%20ruby%20.&text=The%20command%20will%20write%20a%20file%20.) and Ruby

```
brew install asdf
asdf plugin add ruby
asdf install ruby 3.4.1
# or
asdf install ruby latest
asdf global ruby 3.4.1
```

### Rails

```
sudo gem install rails
```

### Migrations

```
rails db:migrate
```

## Running Locally

```
rails s
```

## Visualizing 3D Models

- [omrips/viewstl](https://github.com/omrips/viewstl)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
