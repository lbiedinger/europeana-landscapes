# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
paintings = Painting.create([
    {europeana_id:"2063604/DEN_280_008", location: "Denmark"},
    {europeana_id:"2063618/FI_280_002", location: "Finland"},
    {europeana_id:"2063618/FI_280_003", location:"France"},
    {europeana_id:"2063623/GER_280_005", location:"Germany"},
    {europeana_id:"2063612/NO_280_007", location:"Norway"},
    {europeana_id:"2063601/_7BEA127D59D24CD9846E010F46F7954C", location:"Romania"},
    {europeana_id:"2063604/DEN_280_001", location:"Denmark"},
    {europeana_id:"2021659/KD2003_0371", location:"Netherlands"}
])