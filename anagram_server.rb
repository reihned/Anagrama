require 'active_record'
require 'sinatra'
require 'mustache'

require './anagram_checker.rb'
require './lib/connection.rb'
require './lib/anagram_class.rb'

def render_full(content)
  render = File.read('./template/home.html')
  result = Mustache.render(render, {content: content})
  result
end

get '/' do

  # LIST ALL
  all_anagrams = Anagram.all
  all_anagrams_arr = all_anagrams.map { |anagram| anagram.attributes }

  list = {
    title: "The Anagrams",
    list: all_anagrams_arr
  } #list

  list_template = File.read('./template/list.html')
  list_html = Mustache.render(list_template, list)

  # DAS FORM
  anagram_columns = Anagram.column_names
  anagram_columns.delete("id")

  form_items = { form_items: anagram_columns, form_path: "/submit", button: 'Submit'}

  form_template = File.read('./template/dyn_form.html')
  form_html = Mustache.render(form_template, form_items)

  content = list_html + form_html

  render_full(content)

end

post '/submit' do

  word1 = params["word1"]
  word2 = params["word2"]

  if anagram_checker(word1,word2)
    status_link = '/success'
    Anagram.create( word1: word1, word2: word2 )
  else
    status_link = '/failure'
  end

  redirect status_link, 303, 'Processed'

end

get '/success' do
  img = "<img src=\"http://i2.kym-cdn.com/photos/images/newsfeed/000/001/122/xzibit-happy.jpg\" >"
  render_full(img)
end

get '/failure' do
  img = "<img src=\"http://i3.kym-cdn.com/photos/images/newsfeed/000/178/102/xzbitsad.png\" >"
  render_full(img)
end
