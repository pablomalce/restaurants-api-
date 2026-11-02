# restaurants-api

A small JSON API for restaurants, built with Ruby on Rails, Devise token authentication and Pundit authorization.

## Context

This was a Le Wagon coding bootcamp exercise, written in one day on 20 August 2020 (two commits). It started from the [lewagon/rails-templates](https://github.com/lewagon/rails-templates) Devise template, and the goal was to practise building a versioned REST API with token authentication and policy-based authorization.

## What it does

- `api/v1/restaurants` routes for `index`, `show`, `create` and `destroy`, rendered as JSON with Jbuilder.
- Read endpoints are public. Writes need a user token (`simple_token_authentication`, with an `authentication_token` column on users).
- `RestaurantPolicy` (Pundit): anyone can view, a signed-in user can create, and only a restaurant's owner can update or destroy it.
- `Api::V1::BaseController` checks that every action is authorized or policy-scoped, and maps Pundit, not-found and server errors to JSON error responses.
- Data model: `User` has many `Restaurant`s and `Comment`s, and a `Restaurant` has many `Comment`s (PostgreSQL schema in `db/schema.rb`).

**Stack:** Ruby 2.6.6, Rails 6.0, PostgreSQL, Devise, simple_token_authentication, Pundit, Jbuilder.

## Known issues

The code stops partway through the exercise and does not run as committed:

- `RestaurantsController` has a syntax error in its `before_action` list (a missing comma), so the app fails to boot.
- Two migrations (`AddTokenToUser` and `AddTokenToUsers`) add the same `authentication_token` column and index to `users`, so `rails db:migrate` fails on a fresh database. `db/schema.rb` is stamped at the first of the two, so the second never ran.
- An `update` action exists, but there is no `update` route for it.
- `show.json.jbuilder` and `render_error` contain typos (wrong block variable, `error` instead of `errors`, and a misspelled status).
- The tests are generated stubs: the model, policy and channel tests are empty, and the one controller test calls a route helper (`api_v1_restaurants_index_url`) that the routes do not define.

## Status

Archived learning project from 2020. It is not maintained.
