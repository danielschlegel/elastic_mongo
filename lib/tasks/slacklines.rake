namespace :elastic_mongo do

  task :reset => :environment do

    ElasticSlackline.all.destroy_all
    JumpingMongo.all.destroy_all

    index = Tire::Index.new JumpingMongo.tire.index.name
    index.delete
  end

  task :run => :environment do


    pro = nil
    easy = nil
    kid = nil
    2.times do |i|

      pro = ElasticSlackline.create(:name => "Jumpline Pro #{i % 2}",
                                    :weight => i % 2 == 0 ? 120 : 200,
                                    :elasticity => i % 2 == 0 ? 3.0 : 3.3)
      easy = ElasticSlackline.create(:name => "Easy Liner #{i % 2}",
                                     :weight => i % 2 == 0 ? 80 : 100,
                                     :elasticity => i % 2 == 0 ? 2.0 : 2.9)
      kid = ElasticSlackline.create(:name => "Kidslacker #{i % 2}",
                                    :weight => i % 2 == 0 ? 40 : 75,
                                    :elasticity => 2.0)
    end

    urls = [
        "http://www.youtube.com/watch?v=LdqcJ1Q6mAs",
        "http://www.youtube.com/watch?v=iDXH5l54CWU",
        "http://www.youtube.com/watch?v=NB-grbp8Ebc",
        "http://www.youtube.com/watch?v=lBIkUziJJmY",
        "http://www.youtube.com/watch?v=UvjzKmMn8hk",
        "http://www.youtube.com/watch?v=1Lu_P-K90oY",
        "http://www.youtube.com/watch?v=pXOtoBXwBzA",
        "http://www.youtube.com/watch?v=b8g09y2h-iY"

    ]

    count = 0
    while true
      JumpingMongo.create(:name => "Crazy Looper #{count}", :url => urls[count % 8], :elastic_slackline => pro)
      JumpingMongo.create(:name => "Line Walker #{count}", :url => urls[count % 7], :elastic_slackline => easy)
      JumpingMongo.create(:name => "Kid Artist #{count}", :url => urls[count % 6], :elastic_slackline => kid)
      sleep 1
      count +=1
      JumpingMongo.tire.index.refresh
    end


  end
end