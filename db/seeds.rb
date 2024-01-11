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
    "new dance club",
    "can anybody tell me how o(n) order of growth works?",
    "oops",
    "yikes, my grades",
]
posts_content = [
    "i love spiderman so much he is my idol i love spiderman so much he is my idol i love spiderman so much he is my idol i love spiderman so much he is my idol i love spiderman so much he is my idol",
    "do you guys know if nus has a dance club i can join near UTOWN ? people are always dancing in front of the mirrors but I'm too scared to approach them and i don't know if they are a part of an official NUS dance group",
    "i've been studying this in my computer science classes (CS1101S) recently and I have no clue how it works. i tried asking the professor, but im still confused with the subject, what do i do?",
    "i posted this on accident",
    "how to cope with all this stress? i failed all my modules this sem and i need to graduate next sem, I need to get a lot of work done too. is there any method you guys use to cope during these kinds of situations?",
]
user_ids = [1, 2, 1, 4, 5]
tag_ids = [[4, 8], [4, 8], [1, 7], [], [1, 7, 9, 10]]

likes = [[1, 3], [1, 4], [2, 6], [3, 7], [4, 1], [1, 6]]

titles.length().times.each do |i|
    Post.create(title: titles[i], content: posts_content[i], user_id: user_ids[i])
    tag_ids[i].each do |tag_id|
        PostTag.create(post_id: i+1, tag_id: tag_id)
    end
end

likes.length().times.each do |i|
    liked_post_id = likes[i][0]
    liking_user_id = likes[i][1]
    Like.create(user_id: liking_user_id, post_id: liked_post_id)
end
