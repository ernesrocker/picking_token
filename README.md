# PickingToken

Gem to get recommended tokens from a json file. Based on the picking problem :
https://gist.github.com/luctus/3db17f4eb1a6d32eebaceb86afcc30e2

## Installation
See documentation in [packages](https://github.com/ernesrocker/picking_token/packages/1010624)

## Usage

Install the gem, and then:

```ruby
    require "picking_token"
    json_path = "PATH_TO_JSON_FILE"
    PickingToken.pick_tokens_recommendations(json_path)
```
Inside the folder ``spec/data_test/`` you can get json files to test,

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ernesrocker/picking_token. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PickingToken project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/picking_token/blob/master/CODE_OF_CONDUCT.md).
