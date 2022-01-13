<p align="center">
  <a href="https://github.com/tangivan/jungle-rails">
    <img src="https://github.com/tangivan/scheduler/blob/master/docs/logo-ivan.png" alt="Logo" width="130" height="80">
  </a>

  <h3 align="center">Jungle</h3>

  <p align="center">
   A mini e-commerce application 
  </p>
</p>

<details open="open">
  <summary>Table of Contents</summary>
  <ul>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#demo-screenshots">Demo Screenshots</a></li>
      </ul>
      <ul>
        <li><a href="#dependencies">Dependencies</a></li>
      </ul>
    </li>
    <li>
    <a href="#features">Features</a>
    </li>
    <li>
    <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#additional-steps-for-apple-m1-machines">Additional Steps for Apple M1 Machines</a></li>
      </ul>
      <ul>
        <li><a href="#setup">Setup</a></li>
      </ul>
      <ul>
        <li><a href="#stripe-testing">Stripe Testing</a></li>
      </ul>
    </li>
  </ul>
</details>

# About The Project
A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. My job was to understand this codebase, add new features, and fix any occuring bugs.
<br/>

## Demo Screenshots


<p align="center">
  Home Page
<img alt="Jungle Home Page" src="https://cdn.discordapp.com/attachments/893671641740107799/930384842552647680/unknown.png" width="100%">
  Sign In Form
<img alt="Jungle Home Page" src="https://cdn.discordapp.com/attachments/893671641740107799/930385211261333504/unknown.png" width="100%">
  Cart Summary
<img alt="Jungle Home Page" src="https://cdn.discordapp.com/attachments/893671641740107799/930389222697869362/unknown.png" width="100%">
</p>
<br />

### Dependencies

- [Rails](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Stripe](https://stripe.com/docs/api)
- [Rspec-Rails](https://github.com/rspec/rspec-rails)
- [Capybara](https://github.com/teamcapybara/capybara)
- [Poltergeist](https://github.com/teampoltergeist/poltergeist)
- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)

# Features

- Fully Responsive 
- All CRUD operations implemented
- User Authentication
- Stripe API Implementation
  <br/>

# Getting Started

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>
