# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "codebytes@email.com", password: "testing123")
Cheatsheet.create(name: "New Cheatsheet", user_id: 1)
Snippet.create(title: "Building Loop Iterators", language: "ruby", snip_count: 2, user_id: 1, code: "array = [1,2,3,4,5,6,7,8]\r\ni = 0\r\n\r\nwhile i < array.length\r\n  # run some code\r\n  i += 1\r\nend")
Tag.create(title: "loops")
Tag.create(title: "iterations")
SnippetTag.create(snippet_id: 1, tag_id: 1)
SnippetTag.create(snippet_id: 1, tag_id: 2)
Snippet.create(title: "Form Creation", language: "html", snip_count: 2, user_id: 1, code: "<form name=\"[NAME]\" action=\"[ROUTE]\" method=\"POST\">\r\n  <input type=\"[TEXT]\" placeholder=\"[PLACEHOLDER]\">\r\n  <input type=\"[PASSWORD]\" placeholder=\"[PLACEHOLDER]\">\r\n  <input type=\"Submit\" value=\"[SUBMIT]\">\r\n</form>")
Tag.create(title: "forms")
Tag.create(title: "login form")
SnippetTag.create(snippet_id: 2, tag_id: 3)
SnippetTag.create(snippet_id: 2, tag_id: 4)
Snippet.create(title: "ERB Conditional Rendering", language: "ruby", snip_count: 2, user_id: 1, code: "<% if conditional %>\r\n  <%= variable %>\r\n<% else %>\r\n  <p>You do not have access!</p>\r\n<% end %>")
Tag.create(title: "erb")
SnippetTag.create(snippet_id: 3, tag_id: 5)



