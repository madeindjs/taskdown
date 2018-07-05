# Todown

Extract tasks from Markdown file.

> I wanted to organize me without use of too complicated software.

Example with _sample.markdown_ file:

~~~txt
# TODO

## Somethings to buy

- [x] Milk
- [ ] Sugar
- [ ] Chocolate @due=2019-02-14

## Ideas

- [x] Make something great @with=ruby @due=2010-01-01

~~~

Become bellow using

~~~bash
$ todown sample.markdown
~~~
~~~txt
+---+----------------------+-------------------------------------+
|   | Name                 | Attributes                          |
+---+----------------------+-------------------------------------+
| X | Milk                 | {}                                  |
|   | Sugar                | {}                                  |
|   | Chocolate            | {:due=>"2019-02-14"}                |
| X | Make something great | {:with=>"ruby", :due=>"2010-01-01"} |
+---+----------------------+-------------------------------------+
~~~


## Usage

You simply define task in your markdown file using [Github task list syntax](https://blog.github.com/2014-04-28-task-lists-in-all-markdown-documents/) like this:

~~~txt
- [x] Make something great
~~~

You can also apply filter using `@tag=value`

~~~txt
- [x] Make something great @with=ruby @due=2010-01-01
~~~

And then you can apply filter can also aply filter

~~~bash
$ todown sample.markdown --field=due --after=2019-01-01
~~~
~~~txt
+---+----------------------+-------------------------------------+
|   | Name                 | Attributes                          |
+---+----------------------+-------------------------------------+
| X | Make something great | {:with=>"ruby", :due=>"2010-01-01"} |
+---+----------------------+-------------------------------------+
~~~

## Installation

```ruby
gem install todown
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/madeindjs/todown. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Todown project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/madeindjs/todown/blob/master/CODE_OF_CONDUCT.md).
