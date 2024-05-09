# SMS.NET.BD SMS gem for ruby

SMS Package for ruby. An API warpper for sms.net.bd sms provider.
[![Gem Version](https://badge.fury.io/rb/smsbd.svg)](https://badge.fury.io/rb/smsbd)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add smsbd

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install smsbd

## Usage

You need an api key from sms.net.bd.
then set Your SMS API KEy in the `.env` file:

```bash
SMS_API_KEY=your_api_key
```

Sending sms:

```ruby
  require 'smsbd'

  sms = Smsbd::Sms.new(api_key=ENV["SMS_API_KEY"])
  sms.send("Hello", "8801700111111")
```

To get balance on your account

```ruby
  sms.balance()
```

Getting report for sms delivery:

```ruby
  sms.report(sms-id)
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dashingspidy/smsbd. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dashingspidy/smsbd/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Smsbd project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dashingspidy/smsbd/blob/main/CODE_OF_CONDUCT.md).
