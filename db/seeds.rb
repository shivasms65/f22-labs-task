# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


exams = []
10.times do |i|
  i += 1
  exams << Exam.new({ name: "Exam #{i}" })
end
Exam.import(exams)

subjects = []
10.times do |j|
  j +=1
  exam_id = rand(1..10)

  subjects << Subject.new({ name: "Subject #{j}", exam_id: exam_id })
end
Subject.import(subjects)

topics = []
10.times do |j|
  j +=1
  subject_id = rand(1..10)

  topics << Topic.new({ name: "Topic #{j}", subject_id: subject_id })
end
Topic.import(topics)

chapters = []
10.times do |j|
  j +=1
  topic_id = rand(1..10)

  chapters << Chapter.new({ name: "Chapter #{j}", topic_id: topic_id })
end
Chapter.import(chapters)

100.times do |j|
  j +=1
  chapter_id = rand(1..10)
  complexity = rand(3)
  valid_option_id = rand(1..4)

  question = Question.create({ description: "Question Description #{j}", complexity: complexity, valid_option_id: valid_option_id, chapter_id: chapter_id })

  4.times do |j|
    j +=1
  
    option = question.options.create({ description: "Question Description #{j}" })
  end
end

10.times do |i|
  i += 1
  user = User.create({ name: "User #{i}", email: "testing_#{i}" })

  30.times do |i|
    question_id = i+1
    option_id = rand(0..4)
    option_id = nil if option_id == 0
    answer = user.answers.create(question_id: question_id, option_id: option_id)
  end
end