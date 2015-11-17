unless Rails.env.test?
  UserGroup.where(id: 1).first_or_create!(
      name: 'Standard Users',
      description: 'Normal users – can’t do much',
      is_an_admin: false,
      is_a_manager: false
  )
  UserGroup.where(id: 2).first_or_create!(
      name: 'Admin Users',
      description: 'System administrators – can do anything',
      is_an_admin: true,
      is_a_manager: false
  )
  UserGroup.where(id: 3).first_or_create!(
      name: 'Managers',
      description: 'Managers – can do some things',
      is_an_admin: false,
      is_a_manager: true
  )
  User.create!(
      email: "your@email.com",
      first_name: "Charlie",
      last_name: 'Browne',
      password: '123123123',
      password_confirmation: "123123123",
      active: true,
      user_group_id: 2 # makes you an Admin user
  )
  User.create!(
      email: "yoursecond@email.com",
      first_name: "Ben",
      last_name: 'Wang',
      password: '123123123',
      password_confirmation: "123123123",
      active: true,
      user_group_id: 2 # makes you an Admin user
  )
  end