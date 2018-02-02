class Contact < ApplicationRecord

    belongs_to :kind #, optional: true
    has_many :phones
    has_one :address
    accepts_nested_attributes_for :phones #aceitar attributos aninhados
    accepts_nested_attributes_for :address, update_only: true # Não vai criar novos endereços quando alterar, vai apenas atualizar oq já 

  #  def as_json(options={})
  #      hash = super(options)
  #      hash[:birthdate] = birthdate_br
  #      hash    
  #  end

  #  def birthdate_br
  #      I18n.l(self.birthdate) unless self.birthdate.blank? # não faça isso A MENOS que não esteja vazio
  #  end

  #  def kind_description
  #      self.kind.description
  #  end

  #  def as_json(options={})
  #      super(
  #          root: true,
  #          methods: [:kind_description, :author ]
  #          #include: {kind: {only: :description }} incluir no json 
  #       )
  #  end

  #  como usar: @contact.to_br
  #  def to_br
  #      {
  #      name: self.name,
  #      email: self.email,
  #      birthdate: birthdate_br
  #      }
  #  end

end
