require 'sinatra'
require 'sqlite3'

# Database connection
DB = SQLite3::Database.new ENV['DB_PATH'] || 'db/database.db'
DB.results_as_hash = true

# Create the table if it doesn't exist

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    sexo TEXT NOT NULL,
    email TEXT NOT NULL
  );
SQL

# Home page with the form
get '/' do
  erb: form
end
# Handle form submission
post '/submit' do
  nome = params[:nome]
  sexo = params[:sexo]
  email = params[:email]

DB.execute("INSERT INTO usuarios (nome, sexo, email) VALUES (?, ?, ?)", [nome, sexo, email])
  redirect '/users'
end

#Display all users
get 'users' do
  @users = DB.execute("SELECT * FROM usuarios")
  erb :users
end