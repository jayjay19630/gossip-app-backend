#create sample tags
["Studying", "Gaming", "Technology", "Pop Culture", "Relationships", "Careers", "Computer Science", "Entertainment", "NUS", "Rants"].each do |tag_name|
    Tag.create(tag_name: tag_name)
end

#create sample users
["peterparkernus", "Gwenstacyfan124", "peterhey1231", "Fancypants2351", "bobatea134", "randomuser"].each do |username|
    User.create(username: username)
end

#create sample posts and corresponding tag combinations
titles = [
    "i love spiderman",
    "new gwen stacy movie",
    "can anybody tell me how o(n) order of growth works?",
    "oops",
    "yikes, my grades",
    "sample",
    "sample",
    "sample",
    "sample",
    "sample",
    "sample",
    "sample",
    "sample",
    "sample",
    "sample",
]
posts_content = [
    "i wonder how he's able to calculate physics as he swings tho",
    "do you guys know if marvel might make a gwen stacy movie???",
    "i've been studying this in my computer science classes (CS1101S) recently and I have no clue how it works",
    "i posted this on accident",
    "how to cope with all this stress? i failed all my modules this sem",
    "random text",
    "random text",
    "random text",
    "random text",
    "random text",
    "random text",
    "random text",
    "random text",
    "random text",
    "random text",
]
likes = [0, 0, 3, 5, 100, 0, 0, 0, 3, 6, 10, 13, 13, 14, 15]
user_ids = [1, 2, 1, 4, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
tag_ids = [[4, 8], [4, 8], [1, 7], [], [1, 7, 9, 10], [], [], [], [1, 5], [6, 7], [], [4, 5], [], [2, 3], []]

titles.length().times.each do |i|
    Post.create(title: titles[i], content: posts_content[i], user_id: user_ids[i], likes: likes[i])
    tag_ids[i].each do |tag_id|
        PostTag.create(post_id: i, tag_id: tag_id)
    end
end
