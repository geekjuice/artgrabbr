class Array
  def rand
    self[super(self.length)]
  end
end

namespace :db do
  desc "Create user records in the development database."

  task populate: :environment do
    require 'faker'

    @schools = ["SAIC", "Parsons", "Pratt", "FIT", "RISD"]
    @majors = ["Fine Arts", "Design", "Fashion", "Freestyle"]
    @sizes = ['3"x5"', '12"x17"', '30"x40"', '8"x15"', '30"x50"']

    admin = User.create!( first_name: "Nicholas",
                          last_name: "Hwang",
                          email: "nh2249@columbia.edu",
                          school: "Columbia",
                          major: "Electrical",
                          bio: "Oh hai",
                          pickup_location: "206 W. 88th St., NY",
                          remote_avatar_url:'http://placehold.it/450x350.gif'
                          )
    3.times do |n|
      title = Faker::Name.title
      artwork = Artwork.create!(
        user_id: admin.id,
        title: title,
        price: rand(5..250).to_s,
        medium: 'Photograph',
        size: '12"x15"',
        info: "Nullam in dui mauris. 
        Vivamus hendrerit arcu sed erat molestie vehicula. 
        Sed auctor neque eu tellus rhoncus ut eleifend nibh 
        porttitor. Ut in nulla enim. Phasellus molestie magna 
        non est bibendum non venenatis nisl tempor. Suspendisse 
        dictum feugiat nisl ut dapibus. Mauris iaculis porttitor 
        posuere. Praesent id metus massa, ut blandit odio. 
        Proin quis tortor orci. Etiam at risus et justo 
        dignissim congue. Donec congue lacinia dui, a porttitor 
        lectus condimentum laoreet. Nunc eu ullamcorper orci. 
        Quisque eget odio ac."
        )

      # uploader = ArtworkimageUploader.new
      2.times do |n|
        if n == 0
          image = 'http://placehold.it/450x350.gif'
        else
          image = 'http://www.housepaintingideas.net/images/wall-painting4.jpg'
        end
        art = ArtworkImage.create!(
          artwork_id: artwork.id,
          remote_image_url: image,
          description: 'HAI',
          showcaseimage: true
          )
        if n==0
          art.toggle!(:showcaseimage)
        end
      end
    end

    3.times do |n|
      firstname  = Faker::Name.first_name
      lastname = Faker::Name.last_name
      email = "example-#{n+1}@artgrabbr.com"
      user = User.create!(  first_name: firstname,
                            last_name: lastname,
                            email: email,
                            school: @schools.rand.to_s,
                            major: @majors.rand.to_s,
                            bio: "Hello!",
                            pickup_location: "2920 Broadway, New York, NY",
                            remote_avatar_url:'http://placehold.it/200x150.gif'
                          )
      3.times do |n|
        title = Faker::Name.title
        artwork = Artwork.create!(
          user_id: user.id,
          title: title,
          price: rand(5..250).to_s,
          medium: 'Photograph',
          size: @sizes.rand.to_s,
          info: "Nullam in dui mauris. 
          Vivamus hendrerit arcu sed erat molestie vehicula. 
          Sed auctor neque eu tellus rhoncus ut eleifend nibh 
          porttitor. Ut in nulla enim. Phasellus molestie magna 
          non est bibendum non venenatis nisl tempor. Suspendisse 
          dictum feugiat nisl ut dapibus. Mauris iaculis porttitor 
          posuere. Praesent id metus massa, ut blandit odio. 
          Proin quis tortor orci. Etiam at risus et justo 
          dignissim congue. Donec congue lacinia dui, a porttitor 
          lectus condimentum laoreet. Nunc eu ullamcorper orci. 
          Quisque eget odio ac."
          )

        # uploader = ArtworkimageUploader.new
        2.times do |n|
          if n == 0
            image = 'http://placehold.it/450x350.gif'
          else
            image = 'http://www.housepaintingideas.net/images/wall-painting4.jpg'
          end
          art = ArtworkImage.create!(
            artwork_id: artwork.id,
            remote_image_url: image,
            description: 'HAI',
            showcaseimage: true
            )
          if n==1
            art.toggle!(:showcaseimage)
          end
        end
      end
    end
  end
end
