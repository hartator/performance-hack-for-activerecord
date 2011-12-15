# Performance Hack to ActiveRecord

### Description

Small patch to ActiveRecord to make smart queries by rewriting Array#[] for ActiveRelation. It's using SQL `limit` and `offset` to get only the relevant objects. Default behavior of ActiveRecord is to get all objects in an array and only after take a subset of this array using Array#[].

### Installation

Simply add `limit_critera.rb` to `config/initializers/` in a Rails App.

### Usage

     Mongoid::Criteria#[3] # add limit(1) and offset(3) to Ruby MondDB Driver Query
     Mongoid::Criteria#[3..5] # add limit (2) and offset(3) to Ruby MondDB Driver Query
     Mongoid::Criteria#one # Get only one object (not first or last)