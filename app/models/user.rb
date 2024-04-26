class User < ApplicationRecord
  # Asociación con los posts
  has_many :posts, dependent: :destroy

  # Validaciones
  validates :name, presence: { message: "Por favor, introduce tu nombre." }
  validates :email, presence: { message: "El correo electrónico es obligatorio." },
                    uniqueness: { message: "Este correo electrónico ya está en uso." },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "El formato del correo electrónico no es válido." }
  validates :password, presence: { message: "Debes ingresar una contraseña." },
                       length: { minimum: 6, message: "La contraseña debe tener al menos %{count} caracteres." }

  # Callback para convertir el email a minúsculas antes de guardar
  before_save :downcase_email

  private

  # Callback para convertir el email a minúsculas antes de guardar
  def downcase_email
    self.email = email.downcase
  end
end

