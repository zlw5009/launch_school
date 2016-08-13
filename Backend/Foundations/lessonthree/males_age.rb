munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

males_age = 0

munsters.each do |name, details| 
  males_age += details["age"] if details["gender"] == "male" 
end

puts males_age