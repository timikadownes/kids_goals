json.id user.id
json.name user.name
json.email user.email

json.kids do 
  json.array! user.kids,
  partial: 'api/kids/kid', as: :kid
end

