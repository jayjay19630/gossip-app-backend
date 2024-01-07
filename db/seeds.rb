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
    "i love spiderman so much he is my idol i love spiderman so much he is my idol i love spiderman so much he is my idol i love spiderman so much he is my idol i love spiderman so much he is my idol",
    "do you guys know if nus has a dance club i can join near UTOWN ? people are always dancing in front of the mirrors but I'm too scared to approach them and i don't know if they are a part of an official NUS dance group",
    "i've been studying this in my computer science classes (CS1101S) recently and I have no clue how it works. i tried asking the professor, but im still confused with the subject, what do i do?",
    "i posted this on accident",
    "how to cope with all this stress? i failed all my modules this sem and i need to graduate next sem, I need to get a lot of work done too. is there any method you guys use to cope during these kinds of situations?",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
]
likes = [0, 0, 3, 5, 100, 0, 0, 0, 3, 6, 10, 13, 13, 14, 15]
user_ids = [1, 2, 1, 4, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
tag_ids = [[4, 8], [4, 8], [1, 7], [], [1, 7, 9, 10], [], [], [], [1, 5], [6, 7], [], [4, 5], [], [2, 3], []]

titles.length().times.each do |i|
    Post.create(title: titles[i], content: posts_content[i], user_id: user_ids[i], likes: likes[i])
    tag_ids[i].each do |tag_id|
        PostTag.create(post_id: i+1, tag_id: tag_id)
    end
end
