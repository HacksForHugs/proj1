# Q0: Why is this error being thrown?

There currently doesn't exist a model called pokemon, so Pokemon.where() within the home controller won't work

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

1. Pokemon are seeded with 100 health and level 
2. Pokemons with their trainer attribute set to nil are called. This is the common factore between all possible pokemon that appear.
3. A random pokemon is selected using .sample method of arrays and set to @pokemon
4. pokemon is then displayed on home method



# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

button_to ===> generates a form with a single button 
"Throw a Pokeball!" ===> text that button appears as
capture_path(id: @pokemon) ===> takes the ID from the pokemon object and passes it through the URI referred to by the prefix capture from capture_path to the corresponding controller method
:method => :patch ===> refers to the HTTP verb of the corresponding controller method

# Question 3: What would you name your own Pokemon?

Bubbi

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

redirect_to trainer_path(@trainer) the trainer path needed the trainer object to get the id from within trainers show method


# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

@pokemon.errors will get me all the errors associated with @pokemons when I failed the validation test that was called during the .save method
flash[:error] will store the error messages  which the controller can then send on the next action request, which in this case is a redirect to the new method. Thus the error message will manifest on the new form.

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
