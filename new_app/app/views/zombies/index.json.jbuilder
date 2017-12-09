# json.array! @zombies, partial: 'zombies/zombie', as: :zombie

json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :name, :age
  json.message I18n.t('zombie_message', name: zombie.name)
end
