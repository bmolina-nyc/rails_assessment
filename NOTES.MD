REQUIREMENTS OF THIS APP

* Use the Ruby on Rails framework.  
-----*** Check ***-----




* Your models must include a has_many, a belongs_to, and a has_many :through relationship. You can include more models to fill out your domain, but there must be at least a model acting as a join table for the has_many through.
The join model must also store an additional user submittable attribute (not just timestamps or auto-created fields) describing the relationship. For example, in a blog domain with comments by users, you'd have a posts table and a users table, with the comments table containing the foreign key for the post_id and the user_id along with the comment's content. In a TODO list application with shareable lists, you'd have a lists table and users table and then a user_lists table giving users access to lists via columns user_id and list_id, but you'd want to add a permission column to user_lists that described how a user relates to the list, whether they could edit it or just view it or delete it, etc.
-----*** there is a state_id model - a user has many licenses through state ids and a license has many users***-----




* Your models should include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.





* You must include at least one class level ActiveRecord scope methods. To some extent these class scopes can be added to power a specific individual feature, such as "My Overdue Tasks" in a TODO application, scoping all tasks for the user by a datetime scope for overdue items, @user.tasks.overdue. Reports make for a good usage of class scopes, such as "Most Valuable Cart by Customer" where the code would implement a Cart.most_valuable and Cart.by_customer which could be combined as Cart.most_valuable.by_customer(@customer).
-----*** This may be complete via the User #history method that shows all former states lived in- revisit this later incase you're still unsure that this requirement was met ***-----



*You must include a nested form that writes to an associated model through a custom attribute writer. An example of this would be a New Recipe form that allowed you to add ingredients that are unique across recipes (thereby requiring a join model, or imagine being able to see all recipes that include Chicken), along with a quantity or description of the ingredient in the recipe. On this form you would have a series of fields named recipe[ingredient_attributes][0][name] and recipe[ingredient_attributes][0][description] which would write to the recipe model through a method ingredient_attributes=. This method cannot be provided via the accepts_nested_attributes_for macro because the custom writer would be responsible for finding or creating a recipe by name and then creating the row in the join model recipe_ingredients with the recipe_id, the ingredient_id, and the description from the form.
-----*** I have a nested attributes form and a method for creating the addresses but a find or create isn't available - requirements may not be met ***-----
-----*** It allows for the creation of a new  address - but you have to overwrite whats in place - it wont save the new state but it is still allowing for it to be in place - not greatly thought out***-----


* Your application must provide a standard user authentication, including signup, login, logout, and passwords. You can use Devise but given the complexity of that system, you should also feel free to roll your own authentication logic.
-----*** Devise Signup and Login are working ***-----

* Your authentication system should allow login from some other service. Facebook, twitter, foursquare, github, etc...
-----*** Facebook Omniauth authorization is working ***-----




* You must make use of a nested resource with the appropriate RESTful URLs. Additionally, your nested resource must provide a form that relates to the parent resource. Imagine an application with user profiles. You might represent a person's profile via the RESTful URL of /profiles/1, where 1 is the primary key of the profile. If the person wanted to add pictures to their profile, you could represent that as a nested resource of /profiles/1/pictures, listing all pictures belonging to profile 1. The route /profiles/1/pictures/new would allow me to upload a new picture to profile 1. Focus on making a working application first and then adding more complexity. Making a nested URL resource like '/divisions/:id/teams/new' is great. Having a complex nested resource like 'countries/:id/sports/:id/divisions/:id/teams/new' is going to make this much harder on you.
-----*** Have included a nested route that allows for a User to add or change his state of residence ***-----
-----*** Have included a nested route that allows for a User to create and edit his passport info***-----





*Your forms should correctly display validation errors. Your fields should be enclosed within a fields_with_errors class and error messages describing the validation failures must be present within the view.
-----*** I believe this requirement has been met via the devise gem/devise_messages partial view  - may need to tweak this to include any other valiation errors - although Devise has caught many so far ***-----
--------***errors are displayed when passport fields are blank or the resident state doesnt match up with the passport application form ***---------




*Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. Logic present in your controllers should be encapsulated as methods in your models. Your views should use helper methods and partials to be as logic-less as possible. Follow patterns in the Rails Style Guide and the Ruby Style Guide.




Goals/Overview -
User Signs In - Through this site, a user will be able to sign up for valid Government docs
User has one License
User has one Passport
User has one Government ID
A License belongs to a User 
A Passport belongs to a User
A License is specific to one State

A user can fill out the form and register for a passport - form should be validated
A user can fill out the form and register for a liscense - form should be validated
A user can fill out the form and register for a gov ID - form should be validated

A user's page should show the docs they currently own


A user has many state addresses (assume he can move from state to state)
A state belongs to a user
A user has many gov_ids
a user has one passport through gov_ids
a user has one state_license through gov_ids
a user has one state_id through gov_ids




















