def save_prompt(source_name, user)
    prompt = TTY::Prompt.new 
    save_source = prompt.yes?("Would you like to save this source?")
    if true 
        User.save_favorite_by_name(source_name, user)
        puts "Success! The source is now available in your Favorite Sources."
    else welcome_options
    end
    welcome_options
end

def save_article(article,user)
    prompt = TTY::Prompt.new 
    save_article = prompt.yes?("Would you like to save this article?")
    if true 
        User.save_favorite_article(article,user)
        puts "Success! The article is now available in your Reading List."
    else welcome_options
    end
end