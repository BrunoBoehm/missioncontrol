# Specs

[x] has_many, a belongs_to, and a has_many :through relationship
[x] reasonable validations for the simple attributes
[x] correctly display validation errors, within a fields_with_errors class and error messages 
[x] include a nested form that writes to an associated model through a custom attribute writer. This method cannot be provided via the accepts_nested_attributes_for macro
[x] standard user authentication, including signup, login, logout, and passwords. You can use Devise.
[x] DRY: Logic present in your controllers should be encapsulated as methods in your models, views should use helper methods and partials
[x] make use of a nested resource with the appropriate RESTful URLs, your nested resource must provide a form that relates to the parent resource like '/profiles/1/pictures/new'

[] authentication system should allow login from some other service: Facebook, twitter, foursquare, github
[] include at least one class level ActiveRecord scope methods, to power a specific individual feature
