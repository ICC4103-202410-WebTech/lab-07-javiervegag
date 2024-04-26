class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts unless table_exists?(:posts) # Agregar esta línea
    
    unless column_exists?(:posts, :user_id) # Verificar si la columna user_id ya existe
      add_reference :posts, :user, foreign_key: true
    end

    unless column_exists?(:posts, :parent_id) # Verificar si la columna parent_id ya existe
      add_reference :posts, :parent, foreign_key: { to_table: :posts }
    end

    unless column_exists?(:posts, :answers_count) # Verificar si la columna answers_count ya existe
      add_column :posts, :answers_count, :integer, default: 0
    end

    unless column_exists?(:posts, :likes_count) # Verificar si la columna likes_count ya existe
      add_column :posts, :likes_count, :integer, default: 0
    end

    unless column_exists?(:posts, :published_at) # Verificar si la columna published_at ya existe
      add_column :posts, :published_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    end

    unless index_exists?(:posts, :published_at) # Verificar si el índice en published_at ya existe
      add_index :posts, :published_at
    end

    unless index_exists?(:posts, :user_id) # Verificar si el índice en user_id ya existe
      add_index :posts, :user_id
    end

    unless index_exists?(:posts, :parent_id) # Verificar si el índice en parent_id ya existe
      add_index :posts, :parent_id
    end
  end
end

  

