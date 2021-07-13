# Googleログイン、トークン認証API
グーグルログイン、Cookieを用いたセッション管理を devise_token_auth を用いて実装している。

このAPIのデモ試用を[このリポジトリ](https://github.com/Ichigo-dev/Google-Oauth-Login-React-Demo)で行った。
# Ruby on Rails 6.* by Docker
## Version
- Ruby 2.7.1  
- Rails 6.0.3.7  
## Step
1. Clone this repository
2. Take commands in this order
```
$ source env.sh
$ build
$ rails db:create
$ up
```
5. You can access http://localhost:3000 
## Options
```
$ source env.sh
$ rspec
$ rubocop
$ yarn
```
