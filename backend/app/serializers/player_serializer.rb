class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :score, :time, :win
end
