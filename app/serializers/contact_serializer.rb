class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind
  has_many :phones
  has_one :address

  def attributes(*args)
        hash = super(*args)
        hash[:birthdate] = birthdate_br
        hash    
  end

  def birthdate_br
    #pt-BR  
    #I18n.l(object.birthdate) unless object.birthdate.blank? # não faça isso A MENOS que não esteja vazio
    object.birthdate.to_time.iso8601 unless object.birthdate.blank? #iso8601 é uma recomendação
  end

end
