class Tag < ApplicationRecord
  # Validaciones
  validates :name, presence: { message: "El nombre del tag no puede estar en blanco. Por favor, proporciona un nombre para el tag." },
                   uniqueness: { message: "Este tag ya existe. Por favor, elige un nombre único para el tag." }

  # Relación con los posts a través de la tabla de unión post_tags
  has_many :post_tags
  has_many :posts, through: :post_tags
end

  
  