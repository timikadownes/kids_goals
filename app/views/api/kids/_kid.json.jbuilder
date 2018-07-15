json.id kid.id
json.name kid.name
json.age kid.age
json.grade kid.grade
json.teacher kid.teacher
json.school kid.school
json.user_id kid.user_id
json.image_url kid.image_url

json.goal do 
  json.array! kid.goals,
    partial: "api/goals/goal",
    as: :goal 
end
