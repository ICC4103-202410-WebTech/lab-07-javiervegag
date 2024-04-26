class Post < ApplicationRecord
  # Relación con el usuario
  belongs_to :user

  # Relación con los tags a través de la tabla de unión post_tags
  has_many :post_tags
  has_many :tags, through: :post_tags

  # Relación auto-referencial para los posts hijos
  belongs_to :parent, class_name: 'Post', optional: true
  has_many :replies, class_name: 'Post', foreign_key: 'parent_id', dependent: :destroy

  # Validaciones
  validates :title, presence: { message: "El título no puede estar en blanco. Por favor, ingresa un título para tu publicación." }
  validates :content, presence: { message: "El contenido no puede estar en blanco. Por favor, escribe algo en el contenido de tu publicación." }
  validates :user_id, presence: { message: "El ID del usuario no puede estar en blanco. Por favor, selecciona un usuario para asociar a esta publicación." }
  validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "El contador de respuestas debe ser igual o mayor que cero." }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "El contador de likes debe ser igual o mayor que cero." }

  # Callback para establecer published_at antes de guardar
  before_save :set_published_at

  private

  # Callback para establecer published_at con el valor predeterminado si no se proporciona
  def set_published_at
    self.published_at ||= Time.zone.now
  end
end


  
  