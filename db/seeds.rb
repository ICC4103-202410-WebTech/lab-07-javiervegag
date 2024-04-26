# Crear 5 usuarios
5.times do |i|
    User.create!(
      name: "User #{i + 1}",
      email: "user#{i + 1}@example.com",
      password: "password"
    )
  end
  
  # Crear 10 publicaciones (posts)
  users = User.all
  10.times do |i|
    user = users.sample
    post = user.posts.create!(
      title: "Post #{i + 1} by #{user.name}",
      content: "Content for Post #{i + 1} by #{user.name}"
    )
  end

    # Crear 5 etiquetas
    5.times do |i|
        Tag.create!(
          name: "Tag #{i + 1}"
        )
      end
  
  # Asociar etiquetas a publicaciones (posts)
  posts = Post.all
  tags = Tag.all
  posts.each do |post|
    rand(1..3).times do
      tag = tags.sample
      post.tags << tag unless post.tags.include?(tag)
    end
  end
