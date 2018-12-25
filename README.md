# Dota2Tournament Test task for Starladder LLC

__Dota2Tournament__ is a teams tournament app based on Rails + PostgreSQL.  

ver.: 0.9, 

Created by v.n.zubarev@gmail.com on 23/12/18
***********************************************************************************************
__Preinstall:__
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html)
- [PostgreSQL](https://www.postgresql.org/)

***********************************************************************************************

__How to:__

1). First, clone this repo to your laptop or computer using terminal (command line): 
- `$ git clone https://github.com/VovkaZy/Dota2Tournament-starladder.git`

2). After this, change the directory to that, which contain game files: 
- `cd dirpath/Dota2Tournament-starladder/`

3). Run bundle to install required gems : 
- `$ bundle install`

4). Install figaro gem: 
- `bundle exec figaro install` to add `config/application.yml` file with `ENV`. 
- Then open `config/application.yml` and set up your `ENV` keys for Starladder oAuth: 
  ```
  # config/application.yml
  
   STARLADDER_CLIENT_ID: 'your_key'
   STARLADDER_CLIENT_SECRET = 'your_secret'    
   
  ```  
     
4). Create, migrate and seed DB by run step-by-step commands listed below 
 - (__Note:__ you need to have [PostgreSQL](https://www.postgresql.org/) preinstalled and configured on your environment): 
 - to create DB: `$ rake db:create` 
 - to migrate DB: `$ rake db:migrate`
 - to seed tournaments:`$ rake db:seed` 


5). Run Puma server: `$ rails s`
 
6). Go to http://127.0.0.1:3000 
   - __Note:__ You need to be logged out on [Starladder](http://auth.starladder.com) before click to `Sign in` button.
    
7). Enjoy! Sign in, create your team (add logo and name), register it in tournaments (as much as you wish).

P.S.: __Note:__ Use 127.0.0.1:3000 , not localhost:3000 for clear auth process.



