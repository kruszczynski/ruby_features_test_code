def create_party(place,time,**options)
  puts "place: #{place}, time: #{time}, options: #{options}"
end

create_party("Club","Evening",{vodka: 'lots'})
#=> place: Club, time: Evening, options: {:vodka=>"lots"}

create_party("Club","Evening",{music: 'loud', party: 'hard'})
#=> place: Club, time: Evening, options: {:music=>"loud", :party=>"hard"}

create_party("Church","Morning")
#=> place: Church, time: Morning, options: {}

create_party("Home", "Tomorrow", "Crasher")
#=> ArgumentError: wrong number of arguments (3 for 2)
#=> from (irb):4:in `create_party'
#=> from (irb):10
#=> from /Users/bartek/.rvm/rubies/ruby-2.0.0-p576/bin/irb:12:in `<main>'
