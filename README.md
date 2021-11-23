# CC-87
Custom-Chat Ruby

# User Possible Roles:
- admin
- default

# Generate documentation (TODO: better documentation for Swagger use and spec example)
1. Run `rails g rspec:swagger {controller_name}` (whitout extension). Do that after adding routes.
		Eg: -> rails g rspec:swagger users_controller
2. Edit the generated spec of your route as you want based on the responses. Example: Add response examples based on status codes when doing a POST. 
3. Run `rails rswag` to generate swagger.yaml.
