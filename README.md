# redmine-plugin

## Installed Plugins & Themes

| Redmine Plugin | URL |
|--- |--- |
| easy_gantt | https://www.easyredmine.jp/redmine-gantt-plugin |
| redmine_agile | https://www.redmineup.com/pages/ja/plugins/agile |
| redmine_checklists | https://www.redmineup.com/pages/plugins/checklists |
| redmine_issue_templates | https://github.com/akiko-pusu/redmine_issue_templates |
| redmine_searchable_selectbox | https://github.com/farend/redmine_searchable_selectbox |
| redmine_view_customize | https://github.com/onozaty/redmine-view-customize |
| additionals | https://github.com/alphanodes/additionals |
| additional_tags | https://github.com/AlphaNodes/additional_tags |

| Redmine Themes | URL |
|--- |--- |
| farend basic | https://github.com/farend/redmine_theme_farend_basic|
| farend fancy | https://github.com/farend/redmine_theme_farend_fancy|

## Usage

1. リポジトリをクローンする

```sh
git clone https://github.com/yasuyuki0321/redmine-plugin.git
```

2. docker compose up でコンテナを起動する

```sh
cd redmine-plugin
docker compose up -d
```

3. redmine のコンテナにログインし、プラグインのインストールを行う

```sh
docker exec -it redmine bash
bundle install --without development test --no-deployment
bundle exec rake redmine:plugins RAILS_ENV=production
exit
```

4. コンテナの再起動を行う

```sh
docker compose down
docker compose up -d
```

5. Redmineにアクセスする

http://localhost:8080

初期パスワード  
id: admin  
pass: admin
