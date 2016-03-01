unless Rails.env.test?
  User.create!(
      email: "your@email.com",
      first_name: "Charlie",
      last_name: 'Browne',
      password: '123123123',
      password_confirmation: "123123123"
  )
end