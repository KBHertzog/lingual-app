//
//  GameModel.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import Foundation

struct GameModel{
    
    var wordList : [Word]
    var languageList : [Language]
    var countriesList : [Country]
    let storageManager : StorageManager<Language>
    init(){
        let _storageManager = StorageManager<Language>(name: "Languages")
        let _languageList = _storageManager.modelData
        languageList = []
        storageManager = _storageManager
        languageList = _languageList
        wordList = [Word(word:"Hallo",origin:"German",translate: "Hello"),Word(word: "Esel", origin: "German", translate: "Donkey"),
                    Word(word:"Nuit", origin:"French",translate: "Night"),Word(word: "Pomme", origin: "French", translate: "Apple"),
                    Word(word: "Vaca", origin: "Spanish", translate: "Cow"), Word(word: "Playa", origin: "Spanish", translate: "Beach"),
                    Word(word: "Reka", origin: "Russian", translate: "River"), Word(word: "derevo", origin: "Russian", translate: "tree"),
                    Word(word: "Maidin", origin: "Gaelic", translate: "Morning"), Word(word: "a rith", origin: "Gaelic", translate: "to run"),
                    Word(word: "Alghurub", origin: "Arabic", translate: "Sunset"), Word(word: "Halib", origin: "Arabic", translate: "Milk"),
                    Word(word: "Xīngxīng", origin: "Mandarin", translate: "Star"), Word(word: "Bàba", origin: "Mandarin", translate: "Dad"),
                    Word(word: "Kojima", origin: "Japanese", translate: "Island"), Word(word: "Asa gohan", origin: "Japanese", translate: "Breakfast"),
                    Word(word: "Bahay", origin: "Tagalog", translate: "House"), Word(word: "bandila", origin: "Tagalog", translate: "flag"),
                    Word(word: "Wang", origin: "Malay", translate: "Money"), Word(word: "untuk berenang", origin: "Malay", translate: "to swim"),
                    Word(word: "thành phố", origin: "Vietnamese", translate: "town"), Word(word: "máy vi tính", origin: "Vietnamese", translate: "computer"),
                    Word(word: "simu", origin: "Swahili", translate: "phone"), Word(word: "pwani", origin: "Swahili", translate: "coast"),
                    Word(word: "osimiri", origin: "Igbo", translate: "coast"), Word(word: "ịkụ azụ̀", origin: "Igbo", translate: "fishing"),
                    Word(word: "Stad", origin: "Afrikaans", translate: "city"), Word(word: "reën", origin: "Afrikaans", translate: "rain"),
                    Word(word: "linzamin kwamfuta", origin: "Hausa", translate: "mouse"), Word(word: "abin wuya", origin: "Hausa", translate: "collar"),
                    Word(word: "umdwebo", origin: "Zulu", translate: "sketchy"), Word(word: "kuhle", origin: "Zulu", translate: "good"),
                    Word(word: "Webseiten", origin: "German", translate: "Websites"),Word(word: "Wasserfall", origin: "German", translate: "Waterfall"),
                    Word(word: "Championne", origin: "French", translate: "Champion"),Word(word: "Écureuil", origin: "French", translate: "Squirrel"),
                    Word(word: "Búfala", origin: "Spanish", translate: "Buffalo"),Word(word: "Telaraña", origin: "Spanish", translate: "Cobwebs"),
                    Word(word: "Svoboda", origin: "Russian", translate: "Freedom"),Word(word: "Novosti", origin: "Russian", translate: "News"),
                    Word(word: "glas", origin: "Gaelic", translate: "green"), Word(word: "cnoc", origin: "Gaelic", translate: "hill"),
                    Word(word: "yashrah", origin: "Arabic", translate: "explain"), Word(word: "albalat", origin: "Arabic", translate: "tile"),
                    Word(word: "Kāfēi", origin: "Mandarin", translate: "Coffee"), Word(word: "Píngzi", origin: "Mandarin", translate: "Bottle"),
                    Word(word: "Kyūen", origin: "Japanese", translate: "Rescue"), Word(word: "Ahiru", origin: "Japanese", translate: "Duck"),
                    Word(word: "bangko", origin: "Tagalog", translate: "bench"), Word(word: "palaka", origin: "Tagalog", translate: "Frog"),
                    Word(word: "Tingkap", origin: "Malay", translate: "Window"), Word(word: "Teater", origin: "Malay", translate: "Theater"),
                    Word(word: "Tấm thảm", origin: "Vietnamese", translate: "Carpet"), Word(word: "Bơ", origin: "Vietnamese", translate: "Butter"),
                    Word(word: "saa", origin: "Swahili", translate: "Clock"), Word(word: "donati", origin: "Swahili", translate: "Donut"),
                    Word(word: "Ihe nkiri", origin: "Igbo", translate: "Concert"), Word(word: "okporo ụzọ", origin: "Igbo", translate: "Traffic"),
                    Word(word: "Kabinet", origin: "Afrikaans", translate: "Cabinet"), Word(word: "Trui", origin: "Afrikaans", translate: "Sweater"),
                    Word(word: "Matashin kai", origin: "Hausa", translate: "Pillow"), Word(word: "zaki", origin: "Hausa", translate: "Lion"),
                    Word(word: "insika", origin: "Zulu", translate: "pillar"), Word(word: "ulwandle", origin: "Zulu", translate: "Ocean"),]
        
        countriesList = [Country(country: "Germany", languages: ["German"], latitude: 52.55932669798038, longitude:  13.43135196697411, capital: "Berlin"),
                        Country(country: "Austria", languages: ["German"], latitude: 48.232081334057945, longitude: 16.385023608398186, capital: "Vienna"),
                        Country(country: "Switzerland", languages: ["German","French"], latitude: 47.00284429382219, longitude: 7.470476931697084, capital: "Bern"),
                         Country(country: "Liechtenstein", languages: ["German"], latitude: 47.1407971465410, longitude: 9.52130755833432, capital: "Vaduz"),
                         Country(country: "France", languages: ["French"], latitude: 48.859623129182985, longitude: 2.342178720497188, capital: "Paris"),
                         Country(country: "Belgium", languages: ["French"], latitude: 50.84632816981557, longitude: 4.360754491005529, capital: "Brussels"),
                         Country(country: "Benin", languages: ["French"], latitude: 6.493420569987742, longitude: 2.6281355638750474, capital: "Porto Novo"),
                         Country(country: "Burkina Faso", languages: ["French"], latitude: 12.372568145070437, longitude: -1.5193358067714045, capital: "Ouagadougou"),
                         Country(country: "Burundi", languages: ["French"], latitude: -3.427639827769653, longitude:  29.924392212129383, capital: "Gitega"),
                         Country(country: "Cameroon", languages: ["French"], latitude: 3.8553085630587716, longitude: 11.513541075367263, capital: "Yaoundé"),
                         Country(country: "Canada", languages: ["French"], latitude: 45.37847927664901, longitude: -75.65809078932993, capital: "Ottawa"),
                        Country(country: "Chad", languages: ["French","Arabic"], latitude: 12.128775497127553, longitude: 15.06947475631474, capital: "N'Djamena"),
                         Country(country: "Ivory Coast", languages: ["French"], latitude: 6.81640658613933, longitude: -5.280278086056314, capital: "Yamoussoukro"),
                         Country(country: "Democratic Republic of Congo", languages: ["French"], latitude: -4.43279234883614, longitude: 15.267124415886132, capital: "Kinshasa"),
                         Country(country: "Djibouti", languages: ["French","Djibouti"], latitude: 11.564794765177153, longitude: 43.1538907342539, capital: "Djibouti"),
                         Country(country: "Equatorial Guinea", languages: ["French", "Spanish"], latitude: 1.609850121660307, longitude: 10.154423938075224, capital: "Malabo"),
                          Country(country: "Haiti", languages: ["French"], latitude: 18.592383230968125, longitude: -72.31310369758705, capital: "Port Au Prince"),
                          Country(country: "Luxembourg", languages: ["French"], latitude: 49.610603051037785, longitude: 6.134324743013664, capital: "Luxembourg"),
                          Country(country: "Madagascar", languages: ["French"], latitude: -18.887665384097538, longitude: 47.511825513052756, capital: "Antananarivo"),
                         Country(country: "Mali", languages: ["French"], latitude: 12.624431713163455, longitude: -8.01874722367618, capital: "Bamako"),
                          Country(country: "Monaco", languages: ["French"], latitude: 43.736898097912054, longitude: 7.421579647656047, capital: "Monaco"),
                          Country(country: "Niger", languages: ["French","Hausa"], latitude: 13.67429843762234, longitude: 2.1804375936110016, capital: "Niamey"),
                          Country(country: "Rwanda", languages: ["French", "Swahili"], latitude: -1.9551604874007837, longitude: 30.08085097042187, capital: "Kigali"),
                         Country(country: "Senegal", languages: ["French"], latitude: 14.722975952251618, longitude: -17.46204893685363, capital: "Dakar"),
                          Country(country: "Seychelles", languages: ["French"], latitude: -4.617892102873187, longitude: 55.45120069890624, capital: "Victoria"),
                          Country(country: "Togo", languages: ["French"], latitude: 6.139649646050474, longitude: 1.2243727902978994, capital: "Lomé"),
                          Country(country: "Vanuatu", languages: ["French"], latitude: -17.73367013382395, longitude: 168.31941505611914, capital: "Port Vila"),
                        Country(country: "Argentina", languages: ["Spanish"], latitude: -34.61191350139981, longitude: -58.425905142818934, capital: "Buenos Aires"),
                         Country(country: "Bolivia", languages: ["Spanish"], latitude: -16.499633966805117, longitude: -68.11755619313776, capital: "La Paz"),
                         Country(country: "Chile", languages: ["Spanish"], latitude: -33.48759974888055, longitude: -70.66622957662685, capital: "Santiago"),
                         Country(country: "Colombia", languages: ["Spanish"], latitude: 4.684633357415278, longitude: -74.02925609632094, capital: "Bogota"),
                         Country(country: "Costa Rica", languages: ["Spanish"], latitude: 9.933583735984286, longitude: -84.11012492959858, capital: "San José"),
                         Country(country: "Dominican Republic", languages: ["Spanish"], latitude: 18.49698594256072, longitude: -69.9122122326869, capital: "Santo Domingo"),
                          Country(country: "Cuba", languages: ["Spanish"], latitude: 23.07217846722814, longitude: -82.34380527702336, capital: "Havana"),
                          Country(country: "Ecuador", languages: ["Spanish"], latitude: -0.1690957171659080, longitude: -78.46316011073846, capital: "Quito"),
                          Country(country: "El Salvador", languages: ["Spanish"], latitude: 13.68912771496747, longitude: -89.20882196561682, capital: "San Salvador"),
                          Country(country: "Guatemala", languages: ["Spanish"], latitude: 14.63850837883509, longitude: -90.51024205914278, capital: "Guatemala City"),
                         Country(country: "Honduras", languages: ["Spanish"], latitude: 14.067167990919556, longitude: -87.12450390153721, capital: "Tegucigalpa"),
                          Country(country: "Mexico", languages: ["Spanish"], latitude: 19.409963370091806, longitude: -99.11315015689509, capital: "Mexico City"),
                          Country(country: "Nicaragua", languages: ["Spanish"], latitude: 12.079992287535, longitude: -86.20901707473841, capital: "Managua"),
                          Country(country: "Panama", languages: ["Spanish"], latitude: 8.948905284687683, longitude: -79.47677831298526, capital: "Panama City"),
                          Country(country: "Paraguay", languages: ["Spanish"], latitude: -25.41452537787661, longitude: -57.48713678873332, capital: "Asunción"),
                        Country(country: "Peru", languages: ["Spanish"], latitude: -12.065785242556887, longitude: -76.98712898194853, capital: "Lima"),
                         Country(country: "Uruguay", languages: ["Spanish"], latitude: -34.89206159580568, longitude: -56.108887713993745, capital: "Montevideo"),
                         Country(country: "Venezuela", languages: ["Spanish"], latitude: 10.422945621028726, longitude: -66.80683510639575, capital: "Maracaibo"),
                         Country(country: "Spain", languages: ["Spanish"], latitude: 40.371038425069266, longitude: -3.6897067235884267, capital: "Madrid"),
                         Country(country: "Russia", languages: ["Russian"], latitude: 55.709393561972554, longitude: 37.6244037086934, capital: "Moscow"),
                          Country(country: "Belarus", languages: ["Russian"], latitude: 53.88720274538574, longitude: 27.59750436167919, capital: "Minsk"),
                          Country(country: "Kyrgyzstan", languages: ["Russian"], latitude: 42.834037862328366, longitude: 74.61038326745339, capital: "Bishkek"),
                          Country(country: "Kazakhstan", languages: ["Russian"], latitude: 51.13318511213959, longitude: 71.4918020719093, capital: "Nur-Sultan"),
                         Country(country: "Ireland", languages: ["Gaelic"], latitude: 53.3403969101542, longitude: -6.220086968752855, capital: "Dublin"),
                          Country(country: "Algeria", languages: ["Arabic"], latitude: 36.714011578677386, longitude: 3.1479153397629145, capital: "Algiers"),
                          Country(country: "Bahrain", languages: ["Arabic"], latitude: 26.221817785606273, longitude: 50.58578750001517, capital: "Manama"),
                          Country(country: "Comoros", languages: ["Arabic"], latitude: -11.709184759429796, longitude: 43.249705591336834, capital: "Moroni"),
                         Country(country: "Egypt", languages: ["Arabic"], latitude: 30.060672395527543, longitude: 31.234602969301708, capital: "Cairo"),
                          Country(country: "Iraq", languages: ["Arabic"], latitude: 33.31285065802512, longitude: 44.383563372421456, capital: "Baghdad"),
                          Country(country: "Jordan", languages: ["Arabic"], latitude: 31.95111449720675, longitude: 35.91191813182329, capital: "Amman"),
                          Country(country: "Kuwait", languages: ["Arabic"], latitude: 29.376775459174418, longitude: 47.97697437256222, capital: "Kuwait City"),
                         Country(country: "Libya", languages: ["Arabic"], latitude: 32.83676947381574, longitude: 13.20506020385924, capital: "Tripoli"),
                          Country(country: "Lebanon", languages: ["Arabic"], latitude: 33.87935230994321, longitude: 35.5060061027069, capital: "Beirut"),
                          Country(country: "Mauritania", languages: ["Arabic"], latitude: 18.070032553171913, longitude: -15.948120649424805, capital: "Nouakchott"),
                          Country(country: "Morocco", languages: ["Arabic"], latitude: 33.971491705737186, longitude: -6.859838154876392, capital: "Rabat"),
                         Country(country: "Oman", languages: ["Arabic"], latitude: 23.598225972366592, longitude: 58.40563161599897, capital: "Muscat"),
                         Country(country: "Palestine", languages: ["Arabic"], latitude: 31.904380363471848, longitude: 35.205476184209154, capital: "Ramallah"),
                         Country(country: "Qatar", languages: ["Arabic"], latitude: 25.3051001840951, longitude: 51.50238174985956, capital: "Doha"),
                        Country(country: "Saudi Arabia", languages: ["Arabic"], latitude: 24.699979010489123, longitude: 46.71129828350427, capital: "Riyadh"),
                         Country(country: "Somalia", languages: ["Arabic"], latitude: 2.04377068701412, longitude: 45.34417001197547, capital: "Mogadishu"),
                         Country(country: "Sudan", languages: ["Arabic"], latitude: 15.479793704599055, longitude: 32.57388142097789, capital: "Khartoum"),
                         Country(country: "Syria", languages: ["Arabic"], latitude: 33.516805347575435, longitude: 36.27640139881837, capital: "Damascus"),
                        Country(country: "Tunisia", languages: ["Arabic"], latitude: 36.782632838227755, longitude: 10.188136373172378, capital: "Tunis"),
                         Country(country: "UAE", languages: ["Arabic"], latitude: 25.19296979647185, longitude: 55.31815341310689, capital: "Dubai"),
                         Country(country: "Yemen", languages: ["Arabic"], latitude: 15.40322485193373, longitude: 44.287576224114574, capital: "Sana'a"),
                         Country(country: "Pakistan", languages: ["Urdu"], latitude: 33.704051852598475, longitude: 73.04696222539258, capital: "Islamabad"),
                         Country(country: "India", languages: ["Urdu"], latitude: 28.604157138933374, longitude: 77.11475974637503, capital: "New Delhi"),
                         Country(country: "China", languages: ["Mandarin"], latitude: 40.13621447337016, longitude: 116.27933002279462, capital: "Beijing"),
                         Country(country: "Taiwan", languages: ["Mandarin"], latitude: 25.03291929146594, longitude: 121.5687301247824, capital: "Taipei"),
                        Country(country: "Singapore", languages: ["Mandarin", "Malay"], latitude: 1.367133318087544, longitude: 103.86437344333103, capital: "Singapore"),
                         Country(country: "Japan", languages: ["Japanese"], latitude: 35.69175552559649, longitude: 139.76278613594516, capital: "Tokyo"),
                         Country(country: "Philippines", languages: ["Tagalog"], latitude: 14.582735281708366, longitude: 121.01623384608821, capital: "Manila"),
                         Country(country: "Malaysia", languages: ["Malay"], latitude: 3.1091555870112657, longitude: 101.72926792269998, capital: "Kuala Lumpur"),
                        Country(country: "Indonesia", languages: ["Malay"], latitude: -6.22684362743407, longitude: 106.84324102692035, capital: "Jakarta"),
                         Country(country: "Brunei", languages: ["Malay"], latitude: 4.916744265627917, longitude: 114.93654490469343, capital: "Bandar Seri Begawan"),
                         Country(country: "Vietnam", languages: ["Vietnamese"], latitude: 21.002254913250283, longitude: 105.84401063771844, capital: "Hanoi"),
                         Country(country: "Tanzania", languages: ["Swahili"], latitude: -6.18520576087554, longitude: 35.778650706037496, capital: "Dodoma"),
                         Country(country: "Kenya", languages: ["Swahili"], latitude: -1.2948064171703988, longitude: 36.822973426554306, capital: "Nairobi"),
                         Country(country: "Uganda", languages: ["Swahili"], latitude: 0.3111672248410334, longitude: 32.583143396787555, capital: "Kampala"),
                         Country(country: "Nigeria", languages: ["Igbo","Hausa"], latitude: 9.065831748930643, longitude: 7.411709722539576, capital: "Abuja"),
                        Country(country: "South Africa", languages: ["Afrikaans","Zulu"], latitude: -33.94697705727003, longitude: 18.489295254183233, capital: "Cape Town")]
    }
}
