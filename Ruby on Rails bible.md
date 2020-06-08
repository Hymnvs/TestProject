# Ruby on Rails bible

## Intro

- Open terminal
- Before doing anything in terminal, type: `/bin/bash --login`
- `ls` to your project

## Approaches

Now we can go to our dev environment located in `~/Desktop/Dev`, theres two folder who have different approaches, both then will be available in `localhost:3000`:

1. `TestProject`: this is a blank `rails` project, which has been generated via the command `rails new <name of the project>` This server can be started via `rails s`

2. `test`: this also is a blank project, but this is literally just one JavaScript file. The server can be started via: `node http_server.js`

## 1. Rails Project

Its preferable to open the whole project folder in a proper text editor like `Visual Studio Code` or something else, just to make things easy on you.

Prepare a second terminal tab and log in again via `/bin/bash --login` and `ls` to your project.

Rails seem to be strictly MVC to keep things tidy, we need to create and maintain `controllers` and `views` separately.

`Views` are the actual physical webpages as far as I can see, `Controllers` just handle everything in the background.

Below are some commands you can use in your terminal to change the project.

| command                                                      | example                                          | description                                                  | location on project files                                    |
| ------------------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `rails g controller <NameOfContoller> <list of name of views`<br /><br />you might have to `--force` it | `rails g controller Welcome me hobbies pictures` | This will create a new `controller` on your rails project which then holds your `views`. The command will automatically create all the needed files in your rails project and also add the newly generated `views` to your `routes` file. | Generated controllers can be found in the folder`app/controllers`<br />Generated views can be found in the folder `app/views/<controllerName>` |
| ...                                                          | ...                                              | ...                                                          | ...                                                          |

### routes

This file seems to hold all the various `views` our webpage can hold, it is located in `config`. Seems like `views` get added here automatically whenever you use `rails g`.

You can define a `root` here, which will be the initial starting position of your webpage, sth like: `root 'welcome#index'`

### views

After a `view` has been created one can edit it directly, for the moment this holds pure HTML.