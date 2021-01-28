//
//  PlaceMarker.swift
//  TravelGuide
//
//  Created by a.sakiv on 15.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps
  
    struct Place: Identifiable {
        var id = UUID()
        var name: String
        var latitude = Double()
        var longitude = Double()
        var coordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        var snippet: String
        var icon: String
        var openUrl: String!
        
    }
    
    
let places: [Place] = [
    Place (name: "Lviv National Academic Opera and Ballet",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "The Solomiya Krushelnytska Lviv State Academic Theatre of Opera and Ballet or Lviv Opera (Ukrainian: Львівська оперa, Polish: Opera Lwowska) is an opera house located in Lviv, Ukraine's largest western city and one of its historic cultural centers. Originally built on former marshland of the submerged Poltva River, the Lviv Opera now located on Freedom Avenue (Ukrainian: Проспект Свободи.), the tree-lined centerpiece of Lviv's historic Old City, a UNESCO World Heritage Site located in the city's Halych district. ", icon: "opera", openUrl: "https://opera.lviv.ua/en/"),
    Place(name: "Lviv Latin Cathedral",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "The Archcathedral Basilica of the Assumption of the Blessed Virgin Mary, usually called simply the Latin Cathedral (Ukrainian: Лати́нський собо́р, Polish: Katedra Łacińska) is a 14th-century Roman Catholic cathedral in Lviv, western Ukraine. It is located in the city's Old Town, in the south western corner of the market square, called Cathedral Square. ", icon: "LatinCathedral", openUrl: "http://lwowskabazylika.org.ua/"),
    Place(name: "Mariya Zankovetska Theater",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "Maria Zankovetska Theatre (Ukrainian: Національний академічний український драматичний театр імені Марії Заньковецької, Natsionalnyi akademichnyi ukrayinskyi dramatychnyi teatr imeni Mariyi Zankovetskoyi; Polish: Teatr Skarbkowski [1]) is a drama theatre in the centre of Lviv, Ukraine, at the intersection of Lesya Ukrayinka Street and Prospekt Svobody. The building was erected in the mid 19th century and until World War I was used as a theatre stage and a session hall of the regional council.", icon: "Zankovetska", openUrl: "https://www.zankovetska.com.ua/"),
    Place(name: "Lviv Art Palace",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "Borys Voznytsky Lviv National Art Gallery (previously - Lwów Art Gallery, Polish: Lwowska Galeria Sztuki), a leading art museum in Ukraine, has over 60,000 artworks in its collection, including works of Polish, Italian, French, German, Dutch and Flemish, Spanish, Austrian and other European artists.[1] The gallery is successor to a Polish institution, Lwowska Galeria Sztuki, founded in 1907 as the city's municipal museum. The Provenance of its current stock comes from a multiplicity of largely Polish sources, including the early purchase by the then city magistrature of the private collection of Jan Jakowicz.", icon: "LvivArtPalace", openUrl: "http://www.lvivpalace.art/"),
    Place(name: "Statue of Taras Shevchenko",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "Taras Hryhorovych Shevchenko (March 9 [O.S. February 25] 1814 – March 10 [O.S. February 26] 1861) was a Ukrainian poet, writer, artist, public and political figure, as well as folklorist and ethnographer. His literary heritage is regarded to be the foundation of modern Ukrainian literature and, to a large extent, the modern Ukrainian language. Shevchenko is also known for many masterpieces as a painter and an illustrator.", icon: "shevchenko_lviv_monument", openUrl: "https://en.wikipedia.org/wiki/Legacy_of_Taras_Shevchenko"),
    Place(name: "Jesuit Church",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "Saints Peter and Paul Garrison Church (1610-1630) is known to Lviv's residents as the Jesuit Church and was built in the style of early baroque in the beginning of the 17th century. The building resembles Rome's Il Gesù Cathedral and is considered one of the most beautiful religious buildings in Lviv. The church was reopened on December 6, 2011 to celebrate the 20th anniversary of the Armed Forces of Ukraine. The rite of consecration of the church building and the celebration of the first Divine Liturgy was done by Archbishop and Metropolitan of Lviv of UGCC bishop Ihor Voznyak. ", icon: "Jesuit", openUrl: "https://en.wikipedia.org/wiki/Saints_Peter_and_Paul_Garrison_Church_(Lviv)"),
    Place(name: "Italian Courtyard",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "The Korniakt Palace has its inner courtyard, known as the Italian courtyard in Lviv. It was created in the time of King Jan III Sobieski, after two palace buildings were joined together. For some time the famous Italian-origin wife of the king - Marie Casimire Louise de La Grange d'Arquien, better known as Marysieńka, lived there. The cosy inner courtyard surrounded by three-floor open galleries gives a sense of open space and at the same time has great acoustics. Nowadays, it is one of the best places for musical concerts and performances.", icon: "Italian-courtyard-Lviv", openUrl: "https://en.wikipedia.org/wiki/Saints_Peter_and_Paul_Garrison_Church_(Lviv)"),
    Place(name: "Museum-Arsenal",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "The City Arsenal (Ukrainian: Львівський міський арсенал, Miskiy arsenal, Polish: Arsenał Miejski we Lwowie) is the oldest of three historic arsenal buildings in Lviv, Ukraine. The other two are the Royal Arsenal and Sieniawski Arsenal. It is a rectangular two-storey structure with a miniature octagonal tower on the north side.[1] The building, in its present shape, was erected in 1554–56 above a 14th-century structure of unknown function.[1] It was formerly attached to the city walls and featured a torture chamber. The arsenal building was blown up by the Swedes during the Great Northern War but was subsequently restored. At present it houses an armoury museum.", icon: "Museum-Arsenal", openUrl: "https://en.wikipedia.org/wiki/Lviv_Arsenal"),
    Place(name: "Memorial Heroyiv Nebesnoyi Sotni",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "Architectural style: Gothic architecture", icon: "memorial1", openUrl: "https://en.wikipedia.org/wiki/Saints_Peter_and_Paul_Garrison_Church_(Lviv)"),
    Place(name: "Benedictine Church and Monastery",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "The Benedictines, officially the Order of Saint Benedict (Latin: Ordo Sancti Benedicti, abbreviated as OSB), are a monastic religious order of the Catholic Church following the Rule of Saint Benedict. They are also sometimes called the Black Monks, in reference to the colour of their religious habits. They were founded by Saint Benedict of Nursia, a 6th-century monk who laid the foundations of Benedictine monasticism through the formulation of his Rule of Saint Benedict. ", icon: "BenedictineChurch", openUrl: "https://en.wikipedia.org/wiki/Benedictines"),
    Place(name: "Dominican Cathedral",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "The Dominican church and monastery (Ukrainian: Домініканський костел і монастир, Dominikanskyi kostel i monastyr, Polish: Kościół i klasztor Dominikanów we Lwowie) in Lviv, Ukraine is located in the city's Old Town, east of the market square. It was originally built as the Roman Catholic church of Corpus Christi, and today serves as the Greek Catholic church of the Holy Eucharist. ", icon: "Dominicana", openUrl: "https://en.wikipedia.org/wiki/Saints_Peter_and_Paul_Garrison_Church_(Lviv)"),
    Place(name: "Johann Georg Pinsel Sculpture Museum",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "Architectural style: Gothic architecture", icon: "JohannMuseum", openUrl: "https://en.wikipedia.org/wiki/Dominican_Church,_Lviv"),
    Place(name: "King Danylo Halytskyi Statue",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "The monument, made under a project designed by sculptors Vasyl Yarych and Roman Romanovych and architect Yarema Churylyk, was installed in 2001. The monument was installed near the place of the former Galician gate, one of the two old entrances to the city.", icon: "KingDanylo", openUrl: "https://lviv.travel/en/places/attractions/pamiatnik-koroliu-danilovi"),
    Place(name: "Lviv Regional State Administration",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "Lviv Oblast (Ukrainian: Львівська область, translit. L’vivs’ka oblast’; also referred to as L’vivshchyna, Ukrainian: Львівщина) is an oblast (province) in western Ukraine. The administrative center of the oblast is the city of Lviv. Population: 2,512,084 (2020 est.)[3].", icon: "ratusha", openUrl: "https://en.wikipedia.org/wiki/Lviv_Oblast"),
    Place(name: "Lviv Chocolate Workshop",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "Lviv Handmade Chocolate is a company that creates handmade chocolate and produces unforgettable emotions with a refined taste… All the chocolates are handmade with great care by our professional chocolatiers. There is a small café on the 1st floor where you can enjoy hot chocolate and taste exquisite coffee, watching the production process of chocolate masterpieces. On the top floor, you will find a summer terrace where guests can try delicious pastries and desserts, drink classic chocolate and refreshing cocktails. You can also find a shop with a big choice of hand made chocolate and chocolate products with different flavors: classic and exclusive truffles, tender praline, sweet marzipans, filled with alcohol and coffee, fruits and nuts.", icon: "LvivChocolate", openUrl: "https://www.chocolate.lviv.ua/en/company/map/lviv-serbska/"),
    Place(name: "Pharmacy Museum",latitude: 49.84424176947402, longitude: 24.02690169868762, snippet: "The Pharmacy Museum (drugsrore-mesuem) in Lviv, Ukraine, was opened in 1966 in the building of an old drugstore at the corner of the Market Square. It is the working drugstore and museum (two in one), the oldest of the existing pharmacies in Lviv. The museum consists of 16 rooms which exhibit antique pharmaceutical appliances, prescriptions, medicines, dishes, a library of pharmacy-related books, and even a reconstructed alchemy workshop.", icon: "PharmacyMuseum", openUrl: "https://en.wikipedia.org/wiki/Pharmacy_Museum")
    
]

    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

    
    
    

