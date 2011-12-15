# Performance Hack to ActiveRecord

### Description

Small patch to ActiveRecord to make smart queries by rewriting Array#[] for ActiveRelation. It's using SQL `limit` and `offset` to get only the relevant objects. Default behavior of ActiveRecord is to get all objects in an array and only after take a subset of this array using Array#[].

### Installation

Simply add `activerelation_limit.rb` to `config/initializers/` in a Rails App.

### Usage

     ActiveRelaltion#[3] # add limit 1 offset 3 to SQL Query
     ActiveRelaltion#[3..5] # add limit 2 offset 3 to SQL Query