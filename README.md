# P2eBuilder

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/p2e_builder`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

To install the gem, enter the following command into your terminal:

`gem install p2e_builder`

## Execution

To run the application in your terminal, enter the command:

`P2eBuilder`

## Usage

Building a character in Pathfinder 2nd Edition is a follows an ABC pneumonic: Ancestry, Background, Class. Ancestry refers to the character's parentage and often includes assumptions about the culture and environment they were raised in. Background describes the role the character has had in society before the point of the adventure's beginning, such as a job or social status. Class determines the abilities, mundane and magical, that a character will learn as they continue on their adventure. Selecting an option (by typing out the full name of the option; number selection is not implemented yet) for any of these aspects will provide a short blurb explaining the option further before asking confirmation if you want to play a character using this option.

The remaining menu options will allow you to display all currently created characters, and selectively display created character cards.

## Pending Updates

P2eBuilder is the beginning of what I intend to make a much larger project. Expected further benchmarks of develpment include:

1) Stat bonuses from ABC choices will be reflected on character cards
2) Storing created characters so they can be referenced again on further executions of the application
3) A full level 1-20 character progression table, referencing feat choices and proficiency increases

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/p2e_builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Code of Conduct

Everyone interacting in the P2eBuilder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/p2e_builder/blob/master/CODE_OF_CONDUCT.md).
