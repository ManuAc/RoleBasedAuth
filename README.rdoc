Dependencies:

Ruby >= 2.0


Steps:

1. Clone the repository

2. Run bundle install (bundle install)

3. Run migrations (bundle exec rake db:migrate)

4. Start the console (bundle exec rails c)

Testing:

  user1 = User.create({name: 'Test1', email: 'test1@gmail.com', mobile: '9988776655'})

  user2 = User.create({name: 'Test2', email: 'test2@gmail.com', mobile: '7788996655'})

  role1 = Role.create({name: 'Admin'})

  role2 = Role.create({name: 'Sales'})

  rule1 = Rule.create({role_id: role1.id, action: 'manage', resource: 'all'})

  rule2 = Rule.create({role_id: role2.id, action: 'read', resource: 'all'})

  rule3 = Rule.create({role_id: role2.id, action: 'update', resource: 'Product'})


  a. Adding roles to Users:

    user1.add_role :Admin

    user1.add_role :Sales

    user2.add_role :Sales


  b. Removing roles from Users

    user1.remove_role :Sales


  c. Checking if the user is allowed to perform an action on a given resource:

    user1.can? :read, :Product  # O/p: true

    user1.can? :destroy, :Product  # O/p: true

    user2.can? :create, :Product  # O/p: false

    user1.cannot? :destroy, :Abc  # O/p: false


Assumptions:

1. I haven't created any example resources. Its assumed that all the resources used to form rules are already exists.
2. Action by name 'manage' is set of all actions.
3. Resource by name 'all' is set of all resources.

  i.e If a role has 'manage' action on all resources then the user with that role can perform any actions on any resources.

4. 'manage' and 'all' takes precedence over all other actions and resources respectively.

  i.e If a role has many rules like

  a. Admin can manage products.
  b. Admin can read products.

  then 'manage' action takes precedence over 'read' so user with Admin role can perform any actions on products. its the same with resources.