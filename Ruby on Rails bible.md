# Ruby on Rails bible

Taking https://guides.rubonrails.org/getting_started.html as some sort of guideline/help.

## Intro

If we got everything set up:

- Open terminal and type: `/bin/bash --login` (no idea why)
- `ls` to your project

## Approaches

Now we can go to our dev environment, the server will be available in `localhost:3000`.

1. `TestProject`: this is a blank `rails` project, which has been generated via the command `rails new <name of the project>`. This server can be started via the command `rails s`


## Rails Project

Its preferable to open the whole project folder in a proper text editor like `Visual Studio Code` or something else, just to make things easy on you.

Prepare a second terminal tab and log in again via `/bin/bash --login` and `ls` to your project.

Rails seem to be strictly MVC to keep things tidy, we need to create and maintain `controllers` and `views` separately.

`Views` are the actual physical webpages as far as I can see, `Controllers` handle everything concerning a view in the background.

Below are some commands you can use in your terminal to conveniently interface with the project.

| command                                                      | example                                                | description                                                  | location on project files                                    |
| ------------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `rails new -h`                                               | -                                                      | Shows all available commands for this script call            | -                                                            |
| `rails g controller <NameOfContoller> <list of name of views`<br /><br />you might have to `--force` it | `rails g controller Welcome index me hobbies pictures` | This will create a new `controller` on your rails project which then holds your `views`. The command will automatically create all the needed files in your rails project and also add the newly generated `views` to your `routes` file. | Generated controllers can be found in the folder`app/controllers`<br />Generated views can be found in the folder `app/views/<controllerName>` |
| ...                                                          | ...                                                    | ...                                                          | ...                                                          |

### routes file

This file seems to hold all the various `views` our webpage can display/navigate to, it is located in `config`. Seems like `views` get added here automatically whenever you use `rails g`.

All the available `views` or `pages` to your website will be listed here.

You can define a `root` here, which will be the initial starting position of your webpage, sth like: `root 'welcome#index` which is `controllerName` + `viewName`.

One can define `resources` here, a `resource` is basically an object with full CRUD operations. Do this by adding something like `resources :articles` to your routes. 

### resource

A resource needs a controller assigned to it, inside the controller the CRUD statements will be handled. For example to make the `new` available, create a method inside your resource controller that looks like this:

```ruby
def new
end
```

or any other CRUD statement.

An action like this demands a `view`. Create a new view for the controller you created in `/app/views/<yourControllerName>/` that carries the name of the CRUD operation you want to handle, in the case above itd be `new.html.erb`. `new` for the command, `html` for the file type ruby expects here and `erb` which allows ruby to embed its code into html.

Form responses have to be handled here, an easy way to see what got submitted to the controller event one can do this to print the data we received:

```ruby
def create
    render plain: params[:article].inspect
end
```

### views

After a `view` has been created one can edit it directly, for the moment this holds pure HTML.

Below are some commands you can use in your views to do various things inside a view.

| command                                                      | example                                                      | description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `<%= link_to "VisibleLinkName", path_to_view%>`              | `<%= link_to "Index", welcome_index_path%>`                  | This will create a hyperlink to another view.<br />`path_to_view` is basically: `controllerName`+ `_` + `viewName` + `_` + `path` |
| `<%= image_tag("pathToImage")%>`                             | `<%= image_tag("random.jpg")%>`                              | This puts a picture on your `view`, seems like it looks for pictures in `/app/assets/images` |
| `<%= form_with scope: :<scopeName>, url: <url_path>, local: true do |form| %>` | `<%= form_with scope: :article, url: articles_path, local: true do |form| %>` | This will allow you to bind forms to an resource, the resource is to be put in `<scopeName>`. <br />`url:` states to which page the action should navigate to<br />`local: true` apparently disables Ajax, whatever that means<br>More info in `forms` |

#### forms

A view can hold one or multiple `forms`, a form is an interactive GUI element.

| command                          | example                           | description                                                  |
| -------------------------------- | --------------------------------- | ------------------------------------------------------------ |
| `<%= form.label :<Name> %>`      | `<%= form.label :Title %>`        | Will create a form of the type `Label`, the text can be defined in `<Name>` |
| `<%= form.text_field :<Name> %>` | `<%= form.text_field :<Title> %>` | Will create a form of the type `TextField`, the text can be defined in `<Name>` |
| same as above                    | same as above                     | same as above, just for other form types, e.g. `text_area`   |
| `<%= form.sumbit %>`             | -                                 | Creates a button on the form that will submit the entered data from the forms (maybe :D) |

Submitting a form send the input to rails in form of parameters, these parameters can and must be referenced inside the controller action events.

Heres an example of how the form gets submitted to the controller:

```
<ActionController::Parameters {"title"=>"text field input", "text"=>"text area input"} permitted: false>
```

### models