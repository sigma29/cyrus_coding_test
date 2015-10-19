require_relative 'person'
require 'byebug'

COMMA_FILENAME = "comma.txt"
SPACE_FILENAME = "space.txt"
PIPE_FILENAME = "pipe.txt"
DATA_MAP = {
  " " => {
    first_name: 1,
    last_name: 0,
    sex: 3,
    birthday: 4,
    favorite_color: 5,
  },
  ", " => {
    last_name: 0,
    first_name: 1,
    sex: 2,
    favorite_color: 3,
    birthday: 4
  },
  " | " => {
    last_name: 0,
    first_name: 1,
    sex: 3,
    favorite_color: 4,
    birthday: 5
  }
}

def read_inputs
  people = []
  read_file(SPACE_FILENAME, " ", people)
  read_file(COMMA_FILENAME, ", ", people)
  read_file(PIPE_FILENAME, " | ", people)
end

def read_file(filename, delimiter, people = [])
  File.open(filename).readlines.each do |line|
    person = read_line(line, delimiter)

    people << person
    person.print
  end
end

def read_line(line, delimiter)
  line = line.split(delimiter)
  data = {}
  map = DATA_MAP[delimiter]
  map.each do |key,value|
    data[key.to_sym] = line[value]
  end

  data[:birthday] = data[:birthday].chomp.gsub("-","/")
  if data[:sex].length == 1
    data[:sex] = data[:sex] == "F" ? "Female" : "Male"
  end

  Person.new(data)
end


read_inputs
