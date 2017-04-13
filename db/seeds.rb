# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

html = Category.create title: 'HTML'
rails = Category.create title: 'Rails'
css = Category.create title: 'css'

Snippet.create [
  { title: 'html doctype', code: '<!doctype html>' },
  { title: 'html viewport meta', code: '<meta name="viewport" content="width=device-width, initial-scale=1">' },
  { title: 'install postgresql mac', code: %(
brew install postegresql
mkdir -p ~/db/postgres
initdb -D ~/db/postgres/data -EUTF-8 --locale=en_US.UTF-8
) },
  { title: 'start postgresql', code: 'pg_ctl start -D ~/db/postgres/data -l ~/db/postgres/postgres.log' },
  { title: 'CSS System Font', description: 'Use the system font on whatever the user’s device is. Means nice typography without loading external fonts.', code: 'font-family: system, -apple-system, -webkit-system-font, BlinkMacSystemFont, Helvetica Neue, Helvetica, Segoe UI, Roboto, Arial, freesans, sans-serif;' },
]
