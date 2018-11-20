# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app -- I used the Sinatra corneal gem to begin my project, and used this lightweight framework to compose my project using MVC.

- [x] Use ActiveRecord for storing information in a database -- My classes inherit from ActiveRecord Base to make to use the methods for SQL and ActiveRecord ORM. The macros I used were a user :has_many family_members; a family_member :has_many chores and :belongs_to a user; and chore :belongs_to a user.

- [x] Include more than one model class (e.g. User, Post, Category) -- I have user, family_member, and model classes.

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) -- a user :has_many family_members and family_member :has_many chores

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -- chore :belongs_to a user and family_member :belongs_to a user

- [x] Include user accounts with unique login attribute (username or email) username and password

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying A family member and a chore can be created, read, updated, or destroyed.

- [x] Ensure that users can't modify content created by other users -- The user must be logged in and the current user must == the creator of the instance they are trying to delete.

- [x] Include user input validations The user name and password must match for the user to login.

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
