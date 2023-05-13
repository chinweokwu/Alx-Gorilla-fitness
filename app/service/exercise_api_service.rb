require 'httparty'
require 'uri'
require'erb'

class ExerciseApiService
  base_uri  'https://exercisedb.p.rapidapi.com/exercises'

  def self.get_exercises
    response = get(base_uri, headers: rapidapi_key)
    return response.parsed_response
  end

  def self.get_exercise(id)
    options = {}
    options[:query] = {id: id} 

    response = get("#{base_uri}/exercise/#{id}", headers: rapidapi_key, **options)
    return response.parsed_response
  end

  def self.get_bodyparts
    response = get("/bodyPartList", headers: rapidapi_key)
    return response.parsed_response
  end

  def self.filter_by_body_part(bodyPart = nil)
    options = {}
    options[:query] = {bodyPart: bodyPart} if bodyPart.present?
    encodedBodyPart = ERB::Util.url_encode(bodyPart)
    response = get("/bodyPart/#{encodedBodyPart}", headers: rapidapi_key, **options)
    return response.parsed_response
  end

  def self.fuzzy_match_body_part(body_part_name)
    body_parts = Exercise.get_bodyparts.map { |bp| bp }
    FuzzyMatch.new(body_parts).find(body_part_name)
  end
end

private

def rapidapi_key
  {
    "Content-Type" => "application/json",
    'X-RapidAPI-Key': '4ef2fac8f4mshb4efce3ed032815p1e5c45jsnfc08996f4680',
    "x-rapidapi-host" => "exercisedb.p.rapidapi.com"
  }
end
