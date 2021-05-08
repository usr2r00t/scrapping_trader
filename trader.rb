require 'open-uri'
require 'nokogiri'

def stock_exchange_cours(page_url)
    doc = Nokogiri::HTML(open(page_url))
    cours = []
    el_tab = doc.css("#currencies-all tbody tr")

    for i in 0...el_tab.length do
        x = doc.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ")
        cours.push({
            :name => x[2],
            :symbol => x[1],
            :market_cap => x[4],
            :price => x[5],
            :circulating_supply => x[6],
            :volume => x[7],
            :percent_1_h => x[8],
            :percent_24_h => x[9],
            :percent_7_d =>x[10]
        })
        puts cours

        puts "Please wait ..."
    end

    puts "Résult is ...Tr"
    cours
end

while 0 < 1 do
    puts stock_exchange_cours("https://coinmarketcap.com/all/views/all/")
    puts "PAUSE"
    sleep 3600
end
