//
//  ViewController.swift
//  IP12_Trivia
//
//  Created by Rai, Rhea on 2/13/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var userCategoryPicker: UIPickerView!
    @IBOutlet var userNumQuestionsPicker: UIPickerView!
    
    var userNumQuestions: Int = 0
    var userCategory: String = ""

    var doublePicker: [[String]] = []
    var chosenCategory: String = ""
    /* MUST RUN AT THE BEGGINING */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //picker
        try! setPickerInitial()
        self.userCategoryPicker.delegate = self
        self.userCategoryPicker.dataSource = self
        //self.userCategoryPicker
    }

    
    /* SET UP THE PICKERS */
    
    //DONE: make this a double picker
    //TODO: figure out how to dynamically change the # based on cat chosen in picker
    //TODO: fix the main storyboard so it just has 1 double picker
    
    //note - using this for example: https://codewithchris.com/uipickerview-example/

    func setPickerInitial()  throws {
        self.chosenCategory = Trivia.getCategories()[0] //temp: start at 1st cat
        self.doublePicker = [Trivia.getCategories(),
                             makeNumberedStringArray(count: try Trivia.getQuestionCountofCategory(categoryName: self.chosenCategory))]
    }
    
    func makeNumberedStringArray(count: Int) -> [String] {
        var numberedStringArray: [String] = [""]
        for i in 1...count {
            numberedStringArray.insert(String(i), at: i-1)
        }
        return numberedStringArray
    }
    
    
    //number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2 //for the 2 options: category and num
    }
    
    //number of roaws of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return doublePicker[1].count
    }
    
    
    // data that's returned
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?  {
        print("called PV")
               
        return doublePicker[component][row]
    }
    
    //detect what the user enters. triggered any time the picker is changed
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //TODO: figure out why this doesn't work
        
        var selectedCategory: String = self.doublePicker[row][component]
        if selectedCategory != self.chosenCategory {
            self.chosenCategory = selectedCategory
            
            self.doublePicker = [Trivia.getCategories(),
                                 makeNumberedStringArray(count: try! Trivia.getQuestionCountofCategory(categoryName: self.chosenCategory))]
            
        }
    }
    
    
//    func setCategoryPicker() {
//        self.userCategoryPicker.delegate = self as UIPickerViewDelegate
//        self.userCategoryPicker.dataSource = self as UIPickerViewDataSource
//    }
//
//    //means - how many it should select
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    //means - how many total
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        //print("ran")
//        return self.allCategories.count
//
//    }
//
//    //means - whats the value of that row
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return self.allCategories[row]
//    }
    
    //number
//    func setNumberPicker() {
//        self.userNumQuestionsPicker.delegate = self as UIPickerViewDelegate
//        self.userNumQuestionsPicker.dataSource = self as UIPickerViewDataSource
//    }
    
    
    /* USER MAKING CHOICES */
    func storeUserCategoryChoice() {
        
        
    }
    
    func storeUserNumberChoice(){
        
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /* DONT TOUCH THIS, ITS VERY LONG*/
    //to fold: select all, command optoin shift left arrow
    /*func loadQuestions() {
    
        //all: [String: [Trivia] ]
        /*1 - General knowledge*/
        allQuestions =
        [
        "General Knowledge" :
        [
        Trivia(q: "According to the BBPA, what is the most common pub name in the UK?", correct: "Red Lion", incorrect: ["Royal Oak", "White Hart", "King\'s Head"]),
        Trivia(q: "What is the world's most expensive spice by weight?", correct: "Saffron", incorrect: ["Cinnamon", "Cardamom", "Vanilla"]),
        Trivia(q: "What type of dog is 'Handsome Dan', the mascot of Yale University?", correct: "Bulldog", incorrect: ["Yorkshire Terrier", "Boxer", "Pug"]),
        Trivia(q: "What name represents the letter \"M\" in the NATO phonetic alphabet?", correct: "Mike", incorrect: ["Matthew", "Mark", "Max"]),
        Trivia(q: "In past times, what would a gentleman keep in his fob pocket?", correct: "Watch", incorrect: ["Money", "Keys", "Notebook"]),
        Trivia(q: "Rolex is a company that specializes in what type of product?", correct: "Watches", incorrect: ["Cars", "Computers", "Sports equipment"]),
        Trivia(q: "What is the largest organ of the human body?", correct: "Skin", incorrect: ["Heart", "large Intestine", "Liver"]),
        Trivia(q: "What does the 'S' stand for in the abbreviation SIM, as in SIM card? ", correct: "Subscriber", incorrect: ["Single", "Secure", "Solid"]),
        Trivia(q: "What geometric shape is generally used for stop signs?", correct: "Octagon", incorrect: ["Hexagon", "Circle", "Triangle"]),
        Trivia(q: "What is the name of the Jewish New Year?", correct: "Rosh Hashanah", incorrect: ["Elul", "New Year", "Succoss"]),
        Trivia(q: "Which of the following Ivy League universities has its official motto in Hebrew as well as in Latin?", correct: "Yale University", incorrect: ["Princeton University", "Harvard University", "Columbia University"]),
        Trivia(q: "What is a \"dakimakura\"?", correct: "A body pillow", incorrect: ["A Chinese meal, essentially composed of fish", "A yoga posture", "A word used to describe two people who truly love each other"]),
        Trivia(q: "Before the 19th Century, the \"Living Room\" was originally called the...", correct: "Parlor", incorrect: ["Open Room", "Sitting Room", "Loft"]),
        Trivia(q: "Which of the following is not another name for the eggplant?", correct: "Potimarron", incorrect: ["Brinjal", "Guinea Squash", "Melongene"]),
        Trivia(q: "Red Vines is a brand of what type of candy?", correct: "Licorice", incorrect: ["Lollipop", "Chocolate", "Bubblegum"]),
        Trivia(q: "Who is a co-founder of music streaming service Spotify?", correct: "Daniel Ek", incorrect: ["Sean Parker", "Felix Miller", "Michael Breidenbruecker"]),
        Trivia(q: "What is the unit of currency in Laos?", correct: "Kip", incorrect: ["Ruble", "Konra", "Dollar"]),
        Trivia(q: "Sciophobia is the fear of what?", correct: "Shadows", incorrect: ["Eating", "Bright lights", "Transportation"]),
        Trivia(q: "Which of the following is an existing family in \"The Sims\"?", correct: "The Goth Family", incorrect: ["The Family", "The Simoleon Family", "The Proud Family"]),
        Trivia(q: "Which of the following buildings is example of a structure primarily built in the Art Deco architectural style?", correct: "Niagara Mohawk Building", incorrect: ["Taipei 101", "One Detroit Center", "Westendstrasse 1"]),
        Trivia(q: "What is on display in the Madame Tussaud's museum in London?", correct: "Wax sculptures", incorrect: ["Designer clothing", "Unreleased film reels", "Vintage cars"]),
        Trivia(q: "Which of these colours is NOT featured in the logo for Google?", correct: "Pink", incorrect: ["Yellow", "Blue", "Green"]),
        Trivia(q: "What is the Spanish word for \"donkey\"?", correct: "Burro", incorrect: ["Caballo", "Toro", "Perro"]),
        Trivia(q: "What is the Swedish word for \"window\"?", correct: "Fönster", incorrect: ["Hål", "Skärm", "Ruta"]),
        Trivia(q: "What is the romanized Korean word for \"heart\"?", correct: "Simjang", incorrect: ["Aejeong", "Jeongsin", "Segseu"]),
        Trivia(q: "What is the name of the popular animatronic singing fish prop, singing such hits such as \"Don't Worry, Be Happy\"?", correct: "Big Mouth Billy Bass", incorrect: ["Big Billy Bass", "Singing Fish", "Sardeen"]),
        Trivia(q: "The Swedish word \"Grunka\" means what in English?", correct: "Thing", incorrect: ["People", "Place", "Pineapple"]),
        Trivia(q: "Disney's Haunted Mansion is home to a trio of Hitchhiking Ghosts. Which of these is NOT one of them?", correct: "Harry", incorrect: ["Gus", "Phineas", "Ezra"]),
        Trivia(q: "What country saw a world record 315 million voters turn out for elections on May 20, 1991?", correct: "India", incorrect: ["United States of America", "Soviet Union", "Poland"]),
        Trivia(q: "According to the United States' CDC, one in how many Americans die annually due to smoking?", correct: "Five", incorrect: ["Twenty", "Ten", "One hundred"]),
        Trivia(q: "Who is the founder of \"The Lego Group\"?", correct: "Ole Kirk Christiansen", incorrect: ["Jens Niels Christiansen", "Kirstine Christiansen", "Gerhardt Kirk Christiansen"]),
        Trivia(q: "The New York Times slogan is, “All the News That’s Fit to…”", correct: "Print", incorrect: ["Digest", "Look", "Read"]),
        Trivia(q: "When was Hubba Bubba first introduced?", correct: "1979", incorrect: ["1984", "1972", "1980"]),
        Trivia(q: "What was Mountain Dew's original slogan?", correct: "Yahoo! Mountain Dew... It'll tickle your innards!", incorrect: ["Give Me A Dew", "Do The Dew", "Get\' that barefoot feelin\' drinkin\' Mountain Dew"]),
        Trivia(q: "According to the 2014-2015 Australian Bureau of Statistics, what percentage of Australians were born overseas?", correct: "28%", incorrect: ["13%", "20%", "7%"]),
        Trivia(q: "What was Bank of America originally established as?", correct: "Bank of Italy", incorrect: ["Bank of Long Island", "Bank of Pennsylvania", "Bank of Charlotte"]),
        Trivia(q: "Virtual reality company Oculus VR lost which of it's co-founders in a freak car accident in 2013?", correct: "Andrew Scott Reisse", incorrect: ["Nate Mitchell", "Jack McCauley", "Palmer Luckey"]),
        Trivia(q: "What machine element is located in the center of fidget spinners?", correct: "Bearings", incorrect: ["Axles", "Gears", "Belts"]),
        Trivia(q: "Originally another word for poppy, coquelicot is a shade of what?", correct: "Red", incorrect: ["Green", "Blue", "Pink"]),
        Trivia(q: "Nephelococcygia is the practice of doing what?", correct: "Finding shapes in clouds", incorrect: ["Sleeping with your eyes open", "Breaking glass with your voice", "Swimming in freezing water"]),
        Trivia(q: "Which of the following is the IATA code for Manchester Airport?", correct: "MAN", incorrect: ["EGLL", "LHR", "EGCC"]),
        Trivia(q: "The likeness of which president is featured on the rare $2 bill of USA currency?", correct: "Thomas Jefferson", incorrect: ["Martin Van Buren", "Ulysses Grant", "John Quincy Adams"]),
        Trivia(q: "What is the star sign of someone born on Valentines day?", correct: "Aquarius", incorrect: ["Pisces", "Capricorn", "Scorpio"]),
        Trivia(q: "The Flag of the European Union has how many stars on it?", correct: "12", incorrect: ["10", "14", "16"]),
        Trivia(q: "When one is \"envious\", they are said to be what color?", correct: "Green", incorrect: ["Red", "Blue", "Yellow"]),
        Trivia(q: "Which of these cities does NOT have a United States Minting location?", correct: "St. Louis, MO", incorrect: ["San Fransisco, CA", "Philidelphia, PA", "West Point, NY"]),
        Trivia(q: "Which of the following British Monarchs never appeared on a circulated pound sterling coin?", correct: "Edward VIII", incorrect: ["Victoria", "George VI", "Charles II"]),
        Trivia(q: "The Mexican Beer \"Corona\" is what type of beer?", correct: "Pale Lager", incorrect: ["India Pale Ale", "Pilfsner", "Baltic Porter"]),
        Trivia(q: "Which of the following blood component forms a plug at the site of injuries?", correct: "Platelets", incorrect: ["Red blood cells", "White blood cells", "Blood plasma"]),
        Trivia(q: "In \"Resident Evil 3\", how many inventory slots does Jill have at the start of the game?", correct: "10", incorrect: ["6", "8", "12"]),
        ],

        
        //Entertainment
        "Entertainment: Books" :
        [
        Trivia(q: "Who wrote \"Harry Potter\"?", correct: "J.K. Rowling", incorrect: ["J.R.R. Tolkien", "Terry Pratchett", "Daniel Radcliffe"]),
        Trivia(q: "George Orwell wrote this book, which is often considered a statement on government oversight.", correct: "1984", incorrect: ["The Old Man and the Sea", "Catcher and the Rye", "To Kill a Mockingbird"]),
        Trivia(q: "Which author and poet famously wrote the line, \"The female of the species is more deadly than the male\"?", correct: "Rudyard Kipling", incorrect: ["Edgar Allan Poe", "William Shakespeare", "William Wordsworth"]),
        Trivia(q: "In the Beatrix Potter books, what type of animal is Tommy Brock?", correct: "Badger", incorrect: ["Fox", "Frog", "Rabbit"]),
        Trivia(q: "Which famous book is sub-titled 'The Modern Prometheus'?", correct: "Frankenstein", incorrect: ["Dracula", "The Strange Case of Dr. Jekyll and Mr. Hyde ", "The Legend of Sleepy Hollow"]),
        Trivia(q: "Who wrote the novel \"Moby-Dick\"?", correct: "Herman Melville", incorrect: ["William Golding", "William Shakespeare", "J. R. R. Tolkien"]),
        Trivia(q: "How many books are in the Chronicles of Narnia series?", correct: "7", incorrect: ["6", "8", "5"]),
        Trivia(q: "What was the name of Captain Nemo's submarine in \"20,000 Leagues Under the Sea\"?", correct: "The Nautilus", incorrect: ["The Neptune", "The Poseidon ", "The Atlantis"]),
        Trivia(q: "In the book \"The Martian\", how long was Mark Watney trapped on Mars (in Sols)?", correct: "549 Days", incorrect: ["765 Days", "401 Days", "324 Days"]),
        Trivia(q: "Who wrote the 1967 horror novel \"Rosemary's Baby\"?", correct: "Ira Levin", incorrect: ["Stephen King", "Robert Bloch", "Mary Shelley"]),
        Trivia(q: "In the Harry Potter universe, what is Cornelius Fudge's middle name?", correct: "Oswald", incorrect: ["James", "Harold", "Christopher"]),
        Trivia(q: "In the Harry Potter universe, who does Draco Malfoy end up marrying?", correct: "Astoria Greengrass", incorrect: ["Pansy Parkinson", "Millicent Bulstrode", "Hermione Granger"]),
        Trivia(q: "What is Ron Weasley's middle name?", correct: "Bilius", incorrect: ["Arthur", "John", "Dominic"]),
        Trivia(q: "What is the fourth book of the Old Testament?", correct: "Numbers", incorrect: ["Genesis", "Exodus", "Leviticus"]),
        Trivia(q: "Abel Magwitch is a character from which Charles Dickens novel?", correct: "Great Expectations", incorrect: ["The Pickwick Papers", "Nicholas Nickleby", "Oliver Twist"]),
        Trivia(q: "Which famous spy novelist wrote the childrens' story \"Chitty-Chitty-Bang-Bang\"?", correct: "Ian Fleming", incorrect: ["Joseph Conrad", "John Buchan", "Graham Greene"]),
        Trivia(q: "What was the name of the Mysterious Island, in Jules Verne's \"The Mysterious Island\"?", correct: "Lincoln Island", incorrect: ["Vulcania Island", "Prometheus Island", "Neptune Island"]),
        Trivia(q: "By what name was the author Eric Blair better known?", correct: "George Orwell", incorrect: ["Aldous Huxley", "Ernest Hemingway", "Ray Bradbury"]),
        Trivia(q: "What was the pen name of novelist, Mary Ann Evans?", correct: "George Eliot", incorrect: ["George Orwell", "George Bernard Shaw", "George Saunders"]),
        Trivia(q: "Who wrote the children's story \"The Little Match Girl\"?", correct: "Hans Christian Andersen", incorrect: ["Charles Dickens", "Lewis Carroll", "Oscar Wilde"]),
        Trivia(q: "How many Harry Potter books are there?", correct: "7", incorrect: ["8", "5", "6"]),
        Trivia(q: "The novel \"Of Mice And Men\" was written by what author? ", correct: "John Steinbeck ", incorrect: ["George Orwell", "Mark Twain ", "Harper Lee"]),
        Trivia(q: "Who wrote the young adult novel \"The Fault in Our Stars\"?", correct: "John Green", incorrect: ["Stephenie Meyer", "Suzanne Collins", "Stephen Chbosky"]),
        Trivia(q: "Who was the author of the 1954 novel, \"Lord of the Flies\"?", correct: "William Golding", incorrect: ["Stephen King", "F. Scott Fitzgerald", "Hunter Fox"]),
        Trivia(q: "J.K. Rowling completed \"Harry Potter and the Deathly Hallows\" in which hotel in Edinburgh, Scotland?", correct: "The Balmoral", incorrect: ["The Dunstane Hotel", "Hotel Novotel", "Sheraton Grand Hotel & Spa"]),
        Trivia(q: "In the year 1818, novelist Mary Shelly is credited with writing a fiction novel and creating this infamous character.", correct: "Frankenstein's monster", incorrect: ["Dracula", "The Thing", "The Invisible Man"]),
        Trivia(q: "What is the name of the three headed dog in Harry Potter and the Sorcerer's Stone?", correct: "Fluffy", incorrect: ["Spike", "Poofy", "Spot"]),
        Trivia(q: "What is the title of the first Sherlock Holmes book by Arthur Conan Doyle?", correct: "A Study in Scarlet", incorrect: ["The Sign of the Four", "A Case of Identity", "The Doings of Raffles Haw"]),
        Trivia(q: "Which American author was also a budding travel writer and wrote of his adventures with his dog Charley?", correct: "John Steinbeck", incorrect: ["F. Scott Fitzgerald", "Ernest Hemingway", "William Faulkner"]),
        Trivia(q: "According to The Hitchhiker's Guide to the Galaxy book, the answer to life, the universe and everything else is...", correct: "42", incorrect: ["Loving everyone around you", "Chocolate", "Death"]),
        Trivia(q: "The book \"The Little Prince\" was written by...", correct: "Antoine de Saint-Exupéry", incorrect: ["Miguel de Cervantes Saavedra", "Jane Austen", "F. Scott Fitzgerald"]),
        Trivia(q: "In the novel \"Lord of the Rings\", how many rings of power were given to the race of man?", correct: "9", incorrect: ["5", "11", "13"]),
        Trivia(q: "In Michael Crichton's novel \"Jurassic Park\", John Hammond meets his demise at the claws of which dinosaur?", correct: "Procompsognathus", incorrect: ["Dilophosaurus", "Tyrannosaurus Rex", "Velociraptor"]),
        Trivia(q: "The book \"Fahrenheit 451\" was written by whom?", correct: "Ray Bradbury", incorrect: ["R. L. Stine", "Wolfgang Amadeus Mozart", "Stephen King"]),
        Trivia(q: "Which of the following is NOT a work done by Shakespeare?", correct: "Trial of Temperance", incorrect: ["Measure For Measure", "Titus Andronicus", "Cymbeline"]),
        Trivia(q: "What is the name of Sherlock Holmes's brother?", correct: "Mycroft Holmes", incorrect: ["Mederi Holmes", "Martin Holmes", "Herbie Hancock Holmes"]),
        Trivia(q: "What book series published by Jim Butcher follows a wizard in modern day Chicago?", correct: "The Dresden Files", incorrect: ["A Hat in Time", "The Cinder Spires", "My Life as a Teenage Wizard"]),
        Trivia(q: "What was the last message of the Dolphins in \"The Hitchhiker's Guide to the Galaxy\"?", correct: "\"So long, and thanks for all the fish.\"", incorrect: ["\\\"The answer is 42.\\\"", "\\\"Land of the brave.\\\"", "\\\"Goodbye cruel world!\\\""]),
        Trivia(q: "What is the make and model of the tour vehicles in \"Jurassic Park\" (1990)?", correct: "1989 Toyota Land Cruiser", incorrect: ["1989 Jeep Wrangler YJ Sahar", "1989 Ford Explorer XLT", "Mercedes M-Class"]),
        Trivia(q: "In \"Little Women\", which of the March sisters married Laurie?", correct: "Amy", incorrect: ["Beth", "Jo", "Meg"]),
        Trivia(q: "In the Magic: The Gathering universe, which plane does the Homelands expansion take place in?", correct: "Ulgrotha", incorrect: ["Bant", "Llanowar", "Tazeem"]),
        Trivia(q: "What's the second book in George R. R. Martin's 'A Song of Ice and Fire' series?", correct: "A Clash of Kings", incorrect: ["A Dance with Dragons", "A Storm of Swords", "A Feast for Crows"]),
        Trivia(q: "What is the name of Eragon's dragon in \"Eragon\"?", correct: "Saphira", incorrect: ["Glaedr", "Thorn", "Arya"]),
        Trivia(q: "Which novel by John Grisham was conceived on a road trip to Florida while thinking about stolen books with his wife?", correct: "Camino Island", incorrect: ["Rogue Lawyer", "Gray Mountain", "The Litigators"]),
        Trivia(q: "Which author co-wrote \"The Communist Manifesto\" alongside Karl Marx?", correct: "Friedrich Engels", incorrect: ["Robert Owen", "Alexander Kerensky", "Paul Lafargue"]),
        Trivia(q: "In which classic novel by Mark Twain did a beggar and Prince of Wales switch clothes, and learn about social class inequality?", correct: "The Prince and the Pauper", incorrect: ["Hamlet", "Wealthy Boy and the Schmuck", "A Modern Twain Story"]),
        Trivia(q: "Which of the following is not a work authored by Fyodor Dostoevsky?", correct: "Anna Karenina", incorrect: ["Notes from the Underground", "Crime and Punishment", "The Brothers Karamazov"]),
        Trivia(q: "Which Russian author wrote the epic novel War and Peace?", correct: "Leo Tolstoy", incorrect: ["Fyodor Dostoyevsky", "Alexander Pushkin", "Vladimir Nabokov"]),
        Trivia(q: "What was Sir Handel's original name in \"The Railway Series\" and it's animated counterpart \"Thomas and Friends?\"", correct: "Falcon", incorrect: ["Eagle", "Kyte", "Swallow"]),
        Trivia(q: "In The Lies of Locke Lamora, what title is Locke known by in the criminal world?", correct: "The Thorn of Camorr", incorrect: ["The Rose of the Marrows", "The Thorn of Emberlain", "The Thorn of the Marrows"]),
        ],

        //Entertainment: Film - 3
        "Entertainment: Film" :
        [
        Trivia(q: "In the movie “The Iron Giant,” this character is the protagonist.", correct: "Hogarth Hughes", incorrect: ["Kent Mansley", "Dean McCoppin", "Annie Hughes"]),
        Trivia(q: "Who played Deputy Marshal Samuel Gerard in the 1993 film \"The Fugitive\"?", correct: "Tommy Lee Jones", incorrect: ["Harrison Ford", "Harvey Keitel", "Martin Landau"]),
        Trivia(q: "Who played the female lead in the 1933 film \"King Kong\"?", correct: "Fay Wray", incorrect: ["Jean Harlow", "Vivien Leigh", "Mae West"]),
        Trivia(q: "Who voiced the character Draco in the 1996 movie 'DragonHeart'?", correct: "Sean Connery", incorrect: ["Dennis Quaid", "Pete Postlethwaite", "Brian Thompson"]),
        Trivia(q: "In the 1984 movie \"The Terminator\", what model number is the Terminator portrayed by Arnold Schwarzenegger?", correct: "T-800", incorrect: ["I-950", "T-888", "T-1000"]),
        Trivia(q: "What is the name of James Dean's character in the 1955 movie \"Rebel Without a Cause\"?", correct: "Jim Stark", incorrect: ["Ned Stark", "Jim Kane", "Frank Stark"]),
        Trivia(q: "The Queen song `A Kind Of Magic` is featured in which 1986 film?", correct: "Highlander", incorrect: ["Flash Gordon", "Labyrinth", "Howard the Duck"]),
        Trivia(q: "What did Alfred Hitchcock use as blood in the film \"Psycho\"? ", correct: "Chocolate syrup", incorrect: ["Ketchup", "Red food coloring", "Maple syrup"]),
        Trivia(q: "Who directed the 1973 film \"American Graffiti\"?", correct: "George Lucas", incorrect: ["Ron Howard", "Francis Ford Coppola", "Steven Spielberg"]),
        Trivia(q: "In what year was the first Transformers movie released?", correct: "1986", incorrect: ["2007", "1984", "2009"]),
        Trivia(q: "What did the first moving picture depict?", correct: "A galloping horse", incorrect: ["A woman in a dress", "A man walking", "A crackling fire"]),
        Trivia(q: "Which movie includes a giant bunny-like spirit who has magic powers including growing trees?", correct: "My Neighbor Totoro", incorrect: ["Hop", "Rise of the Guardians", "Alice in Wonderland"]),
        Trivia(q: "Who plays Alice in the Resident Evil movies?", correct: "Milla Jovovich", incorrect: ["Madison Derpe", "Milla Johnson", "Kim Demp"]),
        Trivia(q: "In 2012, which movie won every category in the 32nd \"Golden Raspberry Awards\"?", correct: "Jack and Jill", incorrect: ["The Girl with the Dragon Tattoo", "Thor", "The King\'s Speech"]),
        Trivia(q: "Which one of these action movies are shot entirely in one take?", correct: "Victoria", incorrect: ["Ip Man 2", "The Bourne Legacy", "Léon: The Professional"]),
        Trivia(q: "Which one of these actors is said to be cut from the film 'E.T. the Extra-Terrestrial'?", correct: "Harrison Ford", incorrect: ["Michael J. Fox", "Andy Kaufman", "Arnold Schwarzenegger"]),
        Trivia(q: "In the 1964 film \"Zulu\", what song does the British Army company sing before the final battle?", correct: "Men of Harlech", incorrect: ["Scotland the Brave", "Colonel Bogey March", "The British Grenadiers"]),
        Trivia(q: "In \"Jurassic World\", what is the name of the dinosaur that is a genetic hybrid?", correct: "Indominus Rex", incorrect: ["Mosasaurus", "Pteranodon", "Tyrannosaurus Rex "]),
        Trivia(q: "In what year was the movie \"Police Academy\" released?", correct: "1984", incorrect: ["1986", "1985", "1983"]),
        Trivia(q: "What year did the James Cameron film \"Titanic\" come out in theaters?", correct: "1997", incorrect: ["1996", "1998", "1999"]),
        Trivia(q: "In the movie Gremlins, after what time of day should you not feed Mogwai?", correct: "Midnight", incorrect: ["Evening", "Morning", "Afternoon"]),
        Trivia(q: "In the 1992 film \"Army of Darkness\", what name does Ash give to his double-barreled shotgun?", correct: "Boomstick", incorrect: ["Bloomstick", "Blastbranch", "2-Pump Chump"]),
        Trivia(q: "The 2016 Disney animated film 'Moana' is based on which culture?", correct: "Polynesian", incorrect: ["Native American", "Japanese", "Nordic"]),
        Trivia(q: "In \"Star Trek Nemesis\", why was Praetor Shinzon created?", correct: "To replace Picard as a Romulan Agent", incorrect: ["To destroy the Enterprise", "To become Picard\'s friend ", "To steal the Enterprise"]),
        Trivia(q: "Leonardo Di Caprio won his first Best Actor Oscar for his performance in which film?", correct: "The Revenant", incorrect: ["The Wolf Of Wall Street", "Shutter Island", "Inception"]),
        Trivia(q: "Which documentary film maker wrote and starred in the film \"My Scientology Movie\" which first debuted in 2015?", correct: "Louis Theroux", incorrect: ["Errol Morris", "Joe Berlinger", "Adam Curtis"]),
        Trivia(q: "What is the make and model of the tour vehicles in \"Jurassic Park\" (1993)?", correct: "1992 Ford Explorer XLT", incorrect: ["1992 Toyota Land Cruiser", "1992 Jeep Wrangler YJ Sahar", "Mercedes M-Class"]),
        Trivia(q: "In what year does Jurassic World open in the \"Jurassic Park\" universe?", correct: "2005", incorrect: ["2007", "2015", "2020"]),
        Trivia(q: "Which actors made up the trio in \"The Good, the Bad, and the Ugly\"? ", correct: "Clint Eastwood, Eli Wallach, and Lee Van Cleef", incorrect: ["Sergio Leone, Ennio Morricone, and Tonino Delli Colli", "Yul Brynner, Steve McQueen, and Charles Bronson", "Aldo Giuffrè, Mario Brega, and Luigi Pistilli"]),
        Trivia(q: "What was Bruce Campbell's iconic one-liner after getting a chainsaw hand in Evil Dead 2?", correct: "Groovy.", incorrect: ["Gnarly.", "Perfect.", "Nice."]),
        Trivia(q: "Who plays \"Bruce Wayne\" in the 2008 movie \"The Dark Knight\"?", correct: "Christian Bale", incorrect: ["Michael Caine", "Ron Dean", "Heath Ledger"]),
        Trivia(q: "For the film \"Raiders of The Lost Ark\", what was Harrison Ford sick with during the filming of the Cairo chase?", correct: "Dysentery", incorrect: ["Anemia", "Constipation", "Acid Reflux "]),
        Trivia(q: "Which actor plays the character \"Tommy Jarvis\" in \"Friday the 13th: The Final Chapter\" (1984)?", correct: "Corey Feldman", incorrect: ["Macaulay Culkin", "Mel Gibson", "Mark Hamill"]),
        Trivia(q: "What was the first feature-length computer-animated movie?", correct: "Toy Story", incorrect: ["Tron", "Lion king", "101 Dalmatians"]),
        Trivia(q: "What is Lilo's last name from Lilo and Stitch?", correct: "Pelekai", incorrect: ["Anoaʻi", "Kealoha", "Kuʻulei"]),
        Trivia(q: "Who provided a majority of the songs and lyrics for \"Spirit: Stallion of the Cimarron\"?", correct: "Bryan Adams", incorrect: ["Smash Mouth", "Oasis", "Air Supply"]),
        Trivia(q: "In Big Hero 6, what fictional city is the Big Hero 6 from?", correct: "San Fransokyo", incorrect: ["San Tokyo", "Tokysisco", "Sankyo"]),
        Trivia(q: "Which 90's comedy cult classic features cameos appearances from Meat Loaf, Alice Cooper and Chris Farley?", correct: "Wayne's World", incorrect: ["Bill & Ted\'s Excellent Adventure", "Dumb and Dumber", "Austin Powers: International Man of Mystery"]),
        Trivia(q: "What is the name of the fictional retro-mod band starring Austin Powers as the lead vocalist?", correct: "Ming Tea", incorrect: ["Cough Fi", "Spear Mint", "Mister E"]),
        Trivia(q: "Which actor and martial artist starred as Colonel Guile in the 1994 action film adaptation of Street Fighter?", correct: "Jean-Claude Van Damme", incorrect: ["Chuck Norris", "Steven Seagal", "Scott Adkins"]),
        Trivia(q: "Ed Koch, the Mayor of New York in 1984, played himself in which Muppets movie?", correct: "The Muppets Take Manhattan", incorrect: ["The Great Muppet Caper", "The Muppet Christmas Carol", "The Muppet Movie"]),
        Trivia(q: "Who did the score to the original Blade Runner?", correct: "Vangelis", incorrect: ["Kitaro", "Yanni", "Enya"]),
        Trivia(q: "In the film \"Requiem for a Dream\", what drug does Jared Leto's character get addicted to?", correct: "Heroin", incorrect: ["Cocaine", "Marijuana", "Oxycodone"]),
        Trivia(q: "Who plays Jack Burton in the movie \"Big Trouble in Little China?\"", correct: "Kurt Russell", incorrect: ["Patrick Swayze", "John Cusack", "Harrison Ford"]),
        Trivia(q: "Which actor plays the role of the main antagonist in the 2011 movie \"Tower Heist?\"", correct: "Alan Alda", incorrect: ["Eddie Murphy", "Alec Baldwin", "Kevin Nealon"]),
        Trivia(q: "What is the name of the foley artist who designed the famous sounds of Star Wars, including Chewbacca's roar and R2-D2's beeps and whistles?", correct: "Ben Burtt", incorrect: ["Ken Burns", "Ralph McQuarrie", "Miranda Keyes"]),
        Trivia(q: "What is the birth name of Michael Caine?", correct: "Maurice Micklewhite", incorrect: ["Morris Coleman", "Carl Myers", "Martin Michaels"]),
        Trivia(q: "Johnny Depp made his big-screen acting debut in which film?", correct: "A Nightmare on Elm Street", incorrect: ["My Bloody Valentine", "Halloween", "Friday the 13th"]),
        Trivia(q: "Which singer is portrayed by Bruce Campbell in the 2002 film 'Bubba Ho-Tep'?", correct: "Elvis Presley", incorrect: ["Johnny Cash", "Hank Williams, Sr.", "Buddy Holly"]),
        Trivia(q: "Which of these films is NOT set in Los Angeles?", correct: "RoboCop", incorrect: ["Blade Runner", "The Terminator", "Predator 2"]),
        ],

        //Entertainment - music
        "Entertainment: Music" :
        [
        Trivia(q: "Which American family band had a 1986 top 10 hit with the song 'Crush On You'?", correct: "The Jets", incorrect: ["DeBarge", "The Jacksons", "The Cover Girls"]),
        Trivia(q: "Who had a US and UK number 1 hit in 1962 with the instrumental, 'Telstar'?", correct: "The Tornados", incorrect: ["The Ventures", "The Spotnicks", "The Tremeloes"]),
        Trivia(q: "\"Some people call me the space cowboy\" is the first line from what song?", correct: "The Joker", incorrect: ["Fandango", "Take The Money and Run", "Fly Like an Eagle"]),
        Trivia(q: "Who recorded the 1975 album 'Captain Fantastic and the Brown Dirt Cowboy'?", correct: "Elton John", incorrect: ["John Denver", "Billy Joel", "Joe Cocker"]),
        Trivia(q: "Who is the lead singer of Pearl Jam?", correct: "Eddie Vedder", incorrect: ["Ozzy Osbourne", "Stone Gossard", "Kurt Cobain"]),
        Trivia(q: "The Red Hot Chili Pepper song \"Give It Away\" is from what album?", correct: "Blood Sugar Sex Magik", incorrect: ["One Hot Minute", "By the Way", "Stadium Arcadium"]),
        Trivia(q: "Who had a 1981 hit with the song \"Japanese Boy\"?", correct: "Aneka", incorrect: ["Toyah", "Sandra", "Madonna"]),
        Trivia(q: "Which song is not by TheFatRat?", correct: "Ascent", incorrect: ["Monody", "Windfall", "Infinite Power!"]),
        Trivia(q: "Which of these aliases has NOT been used by electronic musician Aphex Twin?", correct: "Burial", incorrect: ["Caustic Window", "Bradley Strider", "GAK"]),
        Trivia(q: "Which of these is NOT a song on The Beatles' 1968 self titled album, also known as the White album?", correct: "Being For The Benefit Of Mr. Kite!", incorrect: ["Why Don\'t We Do It in the Road?", "Everybody\'s Got Something to Hide Except Me and My Monkey", "The Continuing Story of Bungalow Bill"]),
        Trivia(q: "Who is the lead singer of Silverchair?", correct: "Daniel Johns", incorrect: ["Ben Gillies", "Chris Joannou", "George Costanza"]),
        Trivia(q: "Which Death Grips album is the only one to feature a band member?", correct: "No Love Deep Web", incorrect: ["Bottomless Pit", "The Money Store", "The Powers That B"]),
        Trivia(q: "Which of these songs is not by Tatsuro Yamashita?", correct: "Lucky Lady Feel So Good ", incorrect: ["Merry-Go Round", "Let\'s Dance Baby", "Love Talkin\'"]),
        Trivia(q: "Which Beatles album does NOT feature any of the band members on it's cover?", correct: "The Beatles (White Album)", incorrect: ["Rubber Soul", "Abbey Road", "Magical Mystery Tour"]),
        Trivia(q: "Which band released songs suchs as \"Rio\", \"Girls on Film\", and \"The Reflex\"?", correct: "Duran Duran", incorrect: ["The Cure", "New Order", "Depeche Mode"]),
        Trivia(q: "Sting, the lead vocalist of The Police, primarily plays what instrument?", correct: "Bass Guitar", incorrect: ["Drums", "Guitar", "Keyboards"]),
        Trivia(q: "Kanye West at 2009 VMA's interrupted which celebrity?", correct: "Taylor Swift", incorrect: ["MF DOOM", "Beyonce", "Beck"]),
        Trivia(q: "In Kendrick Lamar's 2012 album, \"Good Kid, M.A.A.D City\", the album's story takes place in which city?", correct: "Compton", incorrect: ["Detroit", "New York", "Baltimore"]),
        Trivia(q: "Which Disney character sings the song \"A Dream is a Wish Your Heart Makes\"?", correct: "Cinderella", incorrect: ["Belle", "Snow White", "Pocahontas"]),
        Trivia(q: "What collaborative album was released by Kanye West and Jay-Z in 2011?", correct: "Watch the Throne", incorrect: ["Distant Relatives", "What a Time to be Alive", "Unfinished Business"]),
        Trivia(q: "What was Daft Punk's first studio album?", correct: "Homework", incorrect: ["Discovery", "Random Access Memories", "Human After All"]),
        Trivia(q: "Which of the following bands is Tom DeLonge not a part of?", correct: "+44", incorrect: ["Box Car Racer", "Blink-182", "Angels & Airwaves"]),
        Trivia(q: "African-American performer Sammy Davis Jr. was known for losing which part of his body in a car accident?", correct: "Left Eye", incorrect: ["Right Ear", "Right Middle Finger", "Nose"]),
        Trivia(q: "Which classical composer wrote the \"Moonlight Sonata\"?", correct: "Ludvig Van Beethoven", incorrect: ["Chief Keef", "Wolfgang Amadeus Mozart", "Johannes Brahms"]),
        Trivia(q: "Which rapper had an album that went double platinum with no features?", correct: "J. Cole", incorrect: ["Kendrick Lamar", "Drake", "Big Sean"]),
        Trivia(q: "Which of these songs is not on the \"untitled\" album by Led Zeppelin?", correct: "Celebration Day", incorrect: ["Stairway to Heaven", "Black Dog", "Rock and Roll"]),
        Trivia(q: "Which member of \"The Beatles\" narrated episodes of \"Thomas the Tank Engine\"?", correct: "Ringo Starr", incorrect: ["George Harrison", "John Lennon", "Paul McCartney"]),
        Trivia(q: "Who was the lead singer and frontman of rock band R.E.M?", correct: "Michael Stipe", incorrect: ["Chris Martin", "Thom Yorke", "George Michael"]),
        Trivia(q: "What is rapper Drake's real name?", correct: "Aubrey Graham", incorrect: ["Shaun Carter", "Dwayne Carter", "Andre Young"]),
        Trivia(q: "Moby, an American DJ, singer, and musician, achieved worldwide success for the 1999 release of which of the following albums?", correct: "Play", incorrect: ["Everything Is Wrong", "Moby", "18"]),
        Trivia(q: "What was the name of Pink Floyd's first studio album?", correct: "The Piper at the Gates of Dawn", incorrect: ["Ummagumma", "More", "Atom Heart Mother"]),
        Trivia(q: "Which of these bands was a featuring artist in Compton rapper Kendrick Lamar's 2017 album, \"DAMN.\"?", correct: "U2", incorrect: ["Radiohead", "Coldplay", "Bon Jovi"]),
        Trivia(q: "Which artist or group did John Lennon consider \"son(s) of the Beatles\"?", correct: "Jeff Lynne's Electric Light Orchestra", incorrect: ["The Rolling Stones", "Pink Floyd", "The Who"]),
        Trivia(q: "What was the name of the cold-war singer who has a song in Grand Theft Auto IV, and a wall landmark in Moscow for his memorial?", correct: "Viktor Tsoi", incorrect: ["Jimi Hendrix", "Brian Jones", "Vladimir Vysotsky"]),
        Trivia(q: "Björk's \"Unison\" contains a sample of which Oval song?", correct: "Aero Deck", incorrect: ["Textuell", "Panorama", "Do While"]),
        Trivia(q: "What was the name of the rock band that Nobuo Uematsu formed that played songs from various Final Fantasy games?", correct: "The Black Mages", incorrect: ["The Final Fantasies", "The Espers", "The Rock Summoners"]),
        Trivia(q: "The 'In the Flesh' tour was used in support of what Pink Floyd album?", correct: "Animals", incorrect: ["The Wall", "Wish You Were Here", "The Final Cut"]),
        Trivia(q: "Chino Moreno is the lead singer of which alternative metal band?", correct: "Deftones", incorrect: ["Tool", "Korn", "Type O Negative"]),
        Trivia(q: "Liam Howlett founded which electronic music group in 1990?", correct: "The Prodigy", incorrect: ["The Chemical Brothers", "The Crystal Method", "Infected Mushroom"]),
        Trivia(q: "What 1970's American ballad referred to the 1959 plane crash as the \"the day the music died\"?", correct: "American Pie", incorrect: ["Kentucky Rain", "I Will Always Love You", "Rock \'n\' Roll Suicide"]),
        Trivia(q: "According to the RIAA: Which artist has sold the most albums by the million?", correct: "The Beatles", incorrect: ["Elvis Presley", "Michael Jackson", "Pink Floyd"]),
        Trivia(q: "Which novelty band was best known for their UK chart hits \"Combine Harvester\" and \"I Am a Cider Drinker\" in 1976?", correct: "The Wurzels", incorrect: ["Goldie Lookin Chain", "Bonzo Dog Doo-Dah Band", "The Firm"]),
        Trivia(q: "Who was \"Kung Fu Fighting\" in 1974?", correct: "Carl Douglas", incorrect: ["The Bee Gees", "Heatwave", "Kool & the Gang"]),
        Trivia(q: "Which song made by MAN WITH A MISSION was used as the opening for the anime \"Log Horizon\"?", correct: "\"Database\"", incorrect: ["\\\"Dead End in Tokyo\\\"", "\\\"Raise Your Flag\\\"", "\\\"Out of Control\\\""]),
        Trivia(q: "\"Hallelujah\" is a song written by which Canadian recording artist?", correct: "Leonard Cohen", incorrect: ["Kory Lefkowits", "Ryan Letourneau ", "Justin Bieber "]),
        Trivia(q: "Which of these is not a song on the album Graduation by Kanye West?", correct: "Waves", incorrect: ["I Wonder", "Big Brother", "The Glory"]),
        Trivia(q: "What was Raekwon the Chefs debut solo album?", correct: "Only Built 4 Cuban Linx", incorrect: ["Shaolin vs Wu-Tang", "The Wild", "The Lex Diamond Story"]),
        Trivia(q: "Who was the guitarist in the band \"The Doors\"?", correct: "Robby Krieger", incorrect: ["Eric Clapton", "John Densmore", "Jimi Hendrix"]),
        Trivia(q: "Which of these artists did NOT feature in the fitfh studio album \"Humanz\" by British virtual band Gorillaz?", correct: "Snoop Dogg", incorrect: ["Vince Staples", "Pusha T", "Danny Brown"]),
        Trivia(q: "When did the rapper Eazy-E die?", correct: "March 26, 1995", incorrect: ["July 11, 1992", "February 14, 1993", "October 21, 1994"]),
        ],

        //entertainment - tv - 4
        "Entertainment: Television" :
        [
        Trivia(q: "In the TV series \"Person of Interest\", who plays the character \"Harold Finch\"?", correct: "Michael Emerson", incorrect: ["Jim Caviezel", "Taraji P. Henson", "Kevin Chapman"]),
        Trivia(q: "What year did the television company BBC officially launch the channel BBC One?", correct: "1936", incorrect: ["1948", "1932", "1955"]),
        Trivia(q: "In the TV show \"Cheers\", Sam Malone was a former relief pitcher for which baseball team?", correct: "Boston Red Sox", incorrect: ["New York Mets", "Baltimore Orioles", "Milwaukee Brewers"]),
        Trivia(q: "In the TV show 'M*A*S*H', what was the nickname of Corporal Walter O'Reilly?", correct: "Radar", incorrect: ["Hawkeye", "Hot Lips", "Trapper"]),
        Trivia(q: "Who sang the theme song for the TV show 'Rawhide'?", correct: "Frankie Laine", incorrect: ["Guy Mitchell", "Tennessee Ernie Ford", "Slim Whitman"]),
        Trivia(q: "Who is the star of the AMC series Breaking Bad?", correct: "Walter White", incorrect: ["Saul Goodman", "Jesse Pinkman", "Skyler White"]),
        Trivia(q: "The theme for the popular science fiction series \"Doctor Who\" was composed by who?", correct: "Ron Grainer", incorrect: ["Murray Gold", "Delia Derbyshire", "Peter Howell"]),
        Trivia(q: "In the original Star Trek TV series, what was Captain James T. Kirk's middle name?", correct: "Tiberius", incorrect: ["Trevor", "Travis", "Tyrone"]),
        Trivia(q: "Who was the star of the TV series \"24\"?", correct: "Kiefer Sutherland", incorrect: ["Kevin Bacon", "Hugh Laurie", "Rob Lowe"]),
        Trivia(q: "Which character does voice actress Tara Strong NOT voice?", correct: "Bubbles (2016)", incorrect: ["Twilight Sparkle", "Timmy Turner", "Harley Quinn"]),
        Trivia(q: "In the show, Doctor Who, what does T.A.R.D.I.S stand for?", correct: "Time And Relative Dimensions In Space", incorrect: ["Time And Resting Dimensions In Space", "Time And Relative Dimensions In Style", "Toilet Aid Rope Dog Is Soup"]),
        Trivia(q: "Who co-founded the YouTube Let's Play channel \"Game Grumps\" alongside Newgrounds animator Egoraptor?", correct: "JonTron", incorrect: ["Pewdiepie", "Tobuscus", "Markiplier"]),
        Trivia(q: "Which company has exclusive rights to air episodes of the \"The Grand Tour\"?", correct: "Amazon", incorrect: ["Netflix", "BBC", "CCTV"]),
        Trivia(q: "Dee from \"It's Always Sunny in Philadelphia\" has dated all of the following guys EXCEPT", correct: "Matthew \"Rickety Cricket\" Mara", incorrect: ["Colin the Thief", "Ben the Soldier", "Kevin Gallagher aka Lil\' Kevin"]),
        Trivia(q: "What was the name of the the first episode of Doctor Who to air in 1963?", correct: "An Unearthly Child", incorrect: ["The Daleks", "The Aztecs", "The Edge of Destruction"]),
        Trivia(q: "Which of these television shows makes everyone look under their chair?", correct: "Oprah", incorrect: ["Jimmy Fallon", "Saturday Night Live", "Larry Rubert"]),
        Trivia(q: "In \"The Big Bang Theory\", what is Howard Wolowitz's nickname in World of Warcraft?", correct: "Wolowizard", incorrect: ["Sheldor", "Rajesh", "Priya"]),
        Trivia(q: "How long was Ken Jennings' win streak on Jeopardy?", correct: "74", incorrect: ["88", "49", "62"]),
        Trivia(q: "What is the name of the \"Flash\" and \"Arrow\" spinoff featuring a team of characters that have appeared on both shows?", correct: "Legends of Tomorrow", incorrect: ["Heroes of Tomorrow", "The Justice Society of America", "The Justice Society"]),
        Trivia(q: "Which show is known for the songs \"You are a Pirate\", \"Cooking by the Book\" and \"We Are Number One\"?", correct: "LazyTown", incorrect: ["Sofia the First", "DuckTales", "Tom and Jerry"]),
        Trivia(q: "In which year did the British television series \"The Bill\" end?", correct: "2010", incorrect: ["2001", "2007", "2012"]),
        Trivia(q: "How many seasons did the TV show \"Donkey Kong Country\" last?", correct: "2", incorrect: ["1", "4", "5"]),
        Trivia(q: "Which of these in the Star Trek series is NOT Klingon food?", correct: "Hors d'oeuvre", incorrect: ["Racht", "Gagh", "Bloodwine"]),
        Trivia(q: "In \"Star Trek\", what is the Klingon delicacy of \"gagh\" made from?", correct: "Serpent worms", incorrect: ["Earthworms", "Spaghetti noodles", "Klingworms"]),
        Trivia(q: "What breed of dog is \"Scooby Doo\"?", correct: "Great Dane", incorrect: ["Pit bull", "Boxer", "Doberman Pinscher"]),
        Trivia(q: "What episode of \"Mr. Bean\" saw him trying to prevent people from seeing him naked?", correct: "Mr. Bean in Room 426", incorrect: ["Mr. Bean Goes to Town", "The Trouble with Mr. Bean", "Back to School Mr. Bean"]),
        Trivia(q: "Alan Reed is known for providing the voice of which character?", correct: "Fred Flintstone", incorrect: ["Bugs Bunny", "Fangface", "G.I. Joe"]),
        Trivia(q: "In Battlestar Galactica (2004), what is the name of the President of the Twelve Colonies?", correct: "Laura Roslin", incorrect: ["William Adama", "Tricia Helfer", "Harry Stills"]),
        Trivia(q: "What is the name of the main antagonists in Battlestar Galactica?", correct: "The Cylons", incorrect: ["The Collective", "The Federation", "The Rebels"]),
        Trivia(q: "In \"Star Trek: Voyager\", which episode did Voyager establish real-time communication with Starfleet Headquarters?", correct: "Pathfinder", incorrect: ["Message In A Bottle", "Someone To Watch Over Me", "Counterpoint"]),
        Trivia(q: "In the TV show \"Mad Men\", what was Donald Draper's birthname?", correct: "Richard \"Dick\" Whitman", incorrect: ["Donald Draper", "John Ashbury", "Michael \\\"Mikey\\\" Wilhelm"]),
        Trivia(q: "What NBC sitcom once saw two of its characters try to pitch NBC on a sitcom about nothing?", correct: "Seinfeld", incorrect: ["Frasier", "Becker", "Friends"]),
        Trivia(q: "What is the name of Chris's brother in \"Everybody Hates Chris\"?", correct: "Drew", incorrect: ["Jerome", "Greg", "Joe"]),
        Trivia(q: "The HBO series \"Game of Thrones\" is based on which series of books?", correct: "A Song of Ice and Fire", incorrect: ["The Wheel of Time", "Harry Potter", "The Notebook"]),
        Trivia(q: "In AMC's TV Series \"The Walking Dead\" what are \"Zombies\" referred to as?", correct: "Walkers", incorrect: ["Creepers", "Maggots", "Hell Pigs"]),
        Trivia(q: "In \"Rick And Morty\", who shot \"Mr. Poopybutthole\" in the episode \"Total Rickall\"?", correct: "Beth", incorrect: ["Rick", "Jerry", "Morty"]),
        Trivia(q: "Baron Silas Greenback is the arch nemesis of which cartoon hero?", correct: "Danger Mouse", incorrect: ["Bananaman", "SuperTed", "Captain Star"]),
        Trivia(q: "Cesar Romero played which iconic Batman villain from the 1960's TV show?", correct: "The Joker", incorrect: ["The Penguin", "The Riddler", "Mr. Freeze"]),
        Trivia(q: "In which state of America was the Fresh Prince of Bel-Air born and raised in?", correct: "Pennsylvania", incorrect: ["Florida", "California", "New Jersey"]),
        Trivia(q: "What is the name of the inspector in the series \"On the Buses\"?", correct: "Blakey", incorrect: ["Harper", "Naily", "Gally"]),
        Trivia(q: "What was the UK \"Who Wants to be a Millionaire?\" cheating scandal known as?", correct: "Major Fraud", incorrect: ["Ingram Cheater", "Coughing Major", "Millionaire Crime"]),
        Trivia(q: "Who was Firestorm's rival during the original run of UK Robot Wars?", correct: "Panic Attack", incorrect: ["Razer", "Chaos 2", "Hypno Disc"]),
        Trivia(q: "In the Sci-Fi television show Doctor Who, who plays the Tenth Doctor?", correct: "David Tennant", incorrect: ["William Hartnell", "Peter Capaldi", "Peter Davison"]),
        Trivia(q: "In the show \"Dragonball Z\", what is the name of Cell's most powerful attack?", correct: "Solar Kamehameha", incorrect: ["Super Kamehameha", "Cell Kamehameha", "Android Kamehameha"]),
        Trivia(q: "Out of the 3 Tots in Tots TV, who speaks French in the UK Version and Spanish in the US Version?", correct: "Tilly", incorrect: ["Tom", "Tiny", "None of the Above"]),
        Trivia(q: "Which of the following awards do Matt Stone and Trey Parker NOT have?", correct: "Oscar", incorrect: ["Emmy", "Tony", "Grammy"]),
        Trivia(q: "What was the date of original airing of the pilot episode of My Little Pony: Friendship is Magic?", correct: "October 10th, 2010", incorrect: ["November 6th, 2010", "April 14th, 1984", "May 18th, 2015"]),
        Trivia(q: "In the show 'Doctor Who', what is the name of the time-capsule model stolen by 'the Doctor'?", correct: "TT Type 40, Mark 3 (TARDIS)", incorrect: ["TT Type 1, Mark 3 (TARDIS)", "TT Type 40, Mark 5 (TARDIS)", "TT Type 1, Mark 5 (TARDIS)"]),
        Trivia(q: "In the show \"The Office\" who does Michael Scott eventually end up with?", correct: "Holly Flax", incorrect: ["Angela Martin", "Jan Levinson", "Pam Beesly"]),
        Trivia(q: "In Two and a Half Men, what is Alan Harper's son's name?", correct: "Jake", incorrect: ["John", "Jeremy", "James"]),
        ],

        //entertainment - video games - 5
        "Entertainment: Video Games" :
        [
        Trivia(q: "When Halo 3: ODST was unveiled in 2008, it had a different title. What was the game formally called?", correct: "Halo 3: Recon", incorrect: ["Halo 3: Helljumpers", "Halo 3: Phantom", "Halo 3: Guerilla"]),
        Trivia(q: "Which of the following created and directed the Katamari Damacy series?", correct: "Keita Takahashi", incorrect: ["Hideki Kamiya", "Shu Takumi", "Shinji Mikami"]),
        Trivia(q: "Who is the protagonist in the game \"The Walking Dead: Season One\"?", correct: "Lee Everett", incorrect: ["Clementine", "Kenny", "Rick Grimes"]),
        Trivia(q: "Who is the writer of the game \"Half-Life\"?", correct: "Marc Laidlaw", incorrect: ["Gabe Newell", "Robin Walker", "Chet Faliszek"]),
        Trivia(q: "Who is the main character of \"Metal Gear Solid 3\"?", correct: "Naked Snake", incorrect: ["Solid Snake", "Liquid Snake", "Venom Snake"]),
        Trivia(q: "What is the fastest speed possible in Trackmania²: Stadium?", correct: "1000 km/h", incorrect: ["500 km/h", "320 km/h", "100 km/h"]),
        Trivia(q: "Who was the first female protagonist in a video game?", correct: "Samus Aran", incorrect: ["Lara Croft", "Alis Landale", "Chell"]),
        Trivia(q: "What two characters from the game Undertale are never in a relationship or not related?", correct: "Frisk & Chara", incorrect: ["Sans & Papyrus", "Toriel & Asgore", "Alphys & Undyne"]),
        Trivia(q: "Meryl Silverburgh, a video game character from the Metal Gear series, was originally a character in which game?", correct: "Policenauts", incorrect: ["Gradius", "Contra", "Castlevania: Symphony of the Night"]),
        Trivia(q: "If you play the Super Mario RPG and nap in a rented hotel room, you will wake up next to what familiar looking character?", correct: "Link", incorrect: ["Wario", "Q*bert", "Solid Snake"]),
        Trivia(q: "In what city in the dystopia alternate future of Half-Life 2 do you first start in?", correct: "City 17", incorrect: ["City 18", "City 6", "City 45"]),
        Trivia(q: "Which of the following characters were considered for inclusion in Super Smash Bros. Melee?", correct: "Lucas", incorrect: ["Mega Man", "Meta Knight", "Diddy Kong"]),
        Trivia(q: "How many zombies need to be killed to get the \"Zombie Genocider\" achievement in Dead Rising (2006)?", correct: "53,594", incorrect: ["53,593", "53,595", "53,596"]),
        Trivia(q: "Which company made the Japanese RPG \"Dragon Quest\"?", correct: "Square Enix", incorrect: ["Capcom", "Konami", "Blizzard"]),
        Trivia(q: "TF2: What code does Soldier put into the door keypad in \"Meet the Spy\"?", correct: "1111", incorrect: ["1432", "1337", "No code"]),
        Trivia(q: "In Fallout 4, which type of power armor is first encountered in the early mission \"When Freedom Calls\" in a crashed Vertibird?", correct: "T-45", incorrect: ["T-51", "T-60", "X-01"]),
        Trivia(q: "In Cook, Serve, Delicious!, which food is NOT included in the game?", correct: "Pie", incorrect: ["Shish Kabob", "Hamburger", "Lasagna"]),
        Trivia(q: "What is the default alias that Princess Garnet goes by in Final Fantasy IX?", correct: "Dagger", incorrect: ["Dirk", "Garnet", "Quina"]),
        Trivia(q: "Which of these is NOT the name of a team leader in Pokémon GO?", correct: "Leif", incorrect: ["Blanche", "Spark", "Candela"]),
        Trivia(q: "In Danganronpa: Trigger Happy Havoc, what is the protagonist's name?", correct: "Makoto Naegi", incorrect: ["Hajime Hinata", "Nagito Komaeda", "Komaru Naegi"]),
        Trivia(q: "Who are the original creators of Rachet & Clank?", correct: "Insomniac Games", incorrect: ["PixelTail Games", "Rare", "Bethesda"]),
        Trivia(q: "In the Half-Life franchise, what is the real name of the \"gravity gun\"?", correct: "Zero-Point Energy Field Manipulator", incorrect: ["Universal Gravity Manipulation Device", "Isaac Newton\'s Theory Disprover", "Quantum Energy Displacement Modifier"]),
        Trivia(q: "What does Solid Snake use to hide himself with?", correct: "Cardboard Box", incorrect: ["Cloaking Device", "Metal Crate", "Cardboard cut-out"]),
        Trivia(q: "What is not a default game mode in Counter-Strike (2000)?", correct: "Arms Race", incorrect: ["Hostage Rescue", "Bomb Defusal", "Assassination"]),
        Trivia(q: "In what year were screenshots added to Steam?", correct: "2011", incorrect: ["2010", "2008", "2009"]),
        Trivia(q: "Which of the following has Jennifer Taylor NOT voiced?", correct: "Sarah Kerrigan", incorrect: ["Princess Peach", "Zoey", "Cortana"]),
        Trivia(q: "In \"Halo\", what is the name of the planet which Installation 04 orbits?", correct: "Threshold", incorrect: ["Substance", "Sanghelios", "Te"]),
        Trivia(q: "In Dota 2, what is Earthshaker's real name?", correct: "Raigor Stonehoof", incorrect: ["Banehallow Ambry", "Carl", "Barathrum"]),
        Trivia(q: "What game was used to advertise Steam?", correct: "Counter-Strike 1.6", incorrect: ["Half-Life", "Half-Life 2", "Team Fortress"]),
        Trivia(q: "Which of the following is not a character in the Street Fighter series?", correct: "Mai Shiranui", incorrect: ["Laura Matsuda", "Sakura Kasugano", "Ibuki"]),
        Trivia(q: "Which of the following games in the The Legend of Zelda franchise was released in Japan before North America?", correct: "The Legend of Zelda: The Minish Cap", incorrect: ["The Legend of Zelda: Twilight Princess", "The Legend of Zelda: Spirit Tracks", "The Legend of Zelda: Four Swords"]),
        Trivia(q: "When was the top-down online RPG \"Space Station 13\" released?", correct: "2003", incorrect: ["2000", "2010", "2006"]),
        Trivia(q: "In the game \"Brawlhalla\", what species is the character Bödvar is?", correct: "Half Human / Half Bear", incorrect: ["A Human", "Half Wolf / Half Bear", "Half Tiger / Half Human"]),
        Trivia(q: "What is not a playable race in \"Final Fantasy XIV: A Realm Reborn\"?", correct: "Hume", incorrect: ["Miqo\'te", "Lalafell", "Roegadyn"]),
        Trivia(q: "When was \"System Shock\" released?", correct: "1994", incorrect: ["1995", "2000", "1998"]),
        Trivia(q: "What is the name of the first level in \"Call of Duty: World at War\"?", correct: "Semper Fi", incorrect: ["Ring of Steel", "Vendetta", "Eviction"]),
        Trivia(q: "Who created the \"Metal Gear\" Series?", correct: "Hideo Kojima", incorrect: ["Hiroshi Yamauchi", "Shigeru Miyamoto", "Gunpei Yokoi"]),
        Trivia(q: "In \"The Witness\", how many lasers must be activated to get into the mountain area?", correct: "7", incorrect: ["8", "5", "12"]),
        Trivia(q: "In Diablo lore, this lesser evil spawned from one of the seven heads of Tathamet, and was known as the Maiden of Anguish.", correct: "Andariel", incorrect: ["Valla", "Malthael", "Kashya"]),
        Trivia(q: "\"Exile\" and \"Revelations\" were the third and fourth installments of which PC game series?", correct: "Myst", incorrect: ["Shivers", "Doom", "Tropico"]),
        Trivia(q: "In the 1980s, a service called Gameline allowed users to download games to what console?", correct: "Atari 2600", incorrect: ["Sega Genesis", "Nintendo Entertainment System", "ColecoVision"]),
        Trivia(q: "What Pokémon's Base Stat Total does not change when it evolves?", correct: "Scyther", incorrect: ["Pikachu", "Sneasel", "Larvesta"]),
        Trivia(q: "What vault in the video game \"Fallout 3\" is the home of multiple clones named Gary?", correct: "Vault 108", incorrect: ["Vault 101", "Vault 87", "Vault 21"]),
        Trivia(q: "What song is played during the ending credits of Guitar Hero: World Tour?", correct: "Dream Theater - Pull Me Under", incorrect: ["King Crimson - 21st Century Schizoid Man", "Dragonforce - Through The Fire & The Flames", "Lynyrd Skynyrd - Free Bird"]),
        Trivia(q: "In \"PUBATTLEGROUNDS\" what is the name of the Military Base island?", correct: "Sosnovka", incorrect: ["Novorepnoye", "Mylta", "Yasnaya"]),
        Trivia(q: "In Night In The Woods, where does Gregg work?", correct: "Snack Falcon", incorrect: ["Ol\' Pickaxe", "Video Outpost \\\"Too\\\"", "Food Donkey"]),
        Trivia(q: "In the Team Fortress 2 canon, what did Shakespearicles NOT invent?", correct: "Stairs", incorrect: ["Two-Story Building", "Rocket Launcher", "Stage Play"]),
        Trivia(q: "Which of 2 Valve Games are set in the same universe?", correct: "Half-life and Portal", incorrect: ["Portal and Left 4 Dead", "Half-life and Left 4 Dead", "Half-life and Counter Strike"]),
        Trivia(q: "Who is the character you play as in Yume Nikki?", correct: "Madotsuki", incorrect: ["Masada", "Uboa", "Poniko"]),
        Trivia(q: "In Pokemon Diamond, Pearl and Platinum, where can a Munchlax be found?", correct: "Honey Trees", incorrect: ["Trading with an NPC", "Grass on Route 209", "Wayward Cave"]),
        ],

        //entertainvment: Board Games - 6
        "Entertainment: Board Games" :
        [
        Trivia(q: "The board game \"Monopoly\" is a variation of what board game?", correct: "The Landlord's Game", incorrect: ["Territorial Dispute", "Property Feud", "The Monopolist\'s Game"]),
        Trivia(q: "Carcassonne is based on which French town?", correct: "Carcassonne", incorrect: ["Paris", "Marseille", "Clermont-Ferrand"]),
        Trivia(q: "In a standard game of Monopoly, what colour are the two cheapest properties?", correct: "Brown", incorrect: ["Green", "Yellow", "Blue"]),
        Trivia(q: "How many spaces are there on a standard Monopoly board?", correct: "40", incorrect: ["28", "55", "36"]),
        Trivia(q: "How many dice are used in the game of Yahtzee?", correct: "Five", incorrect: ["Four", "Six", "Eight"]),
        Trivia(q: "How many pieces are there on the board at the start of a game of chess?", correct: "32", incorrect: ["16", "20", "36"]),
        Trivia(q: "On a standard Monopoly board, which square is diagonally opposite 'Go'? ", correct: "Free Parking", incorrect: ["Go to Jail", "Jail", "The Electric Company"]),
        Trivia(q: "How many dots are on a single die?", correct: "21", incorrect: ["24", "15", "18"]),
        Trivia(q: "At the start of a standard game of the Monopoly, if you throw a double six, which square would you land on?", correct: "Electric Company", incorrect: ["Water Works", "Chance", "Community Chest"]),
        Trivia(q: "What is the world's oldest board game?", correct: "Senet", incorrect: ["Chess", "Checkers", "Go"]),
        Trivia(q: "The board game, Nightmare was released in what year?", correct: "1991", incorrect: ["1992", "1989", "1995"]),
        Trivia(q: "Who is the main character in the VHS tape included in the board game Nightmare?", correct: "The Gatekeeper", incorrect: ["The Kryptkeeper", "The Monster", "The Nightmare"]),
        Trivia(q: "How many points is the Z tile worth in Scrabble?", correct: "10", incorrect: ["8", "5", "6"]),
        Trivia(q: "What special item did the creators of Cards Against Humanity ship for their Black Friday pack?", correct: "Bull Feces", incorrect: ["A Card Expansion", "A Racist Toy", "Cat Urine"]),
        Trivia(q: "Which of these games includes the phrase \"Do not pass Go, do not collect $200\"?", correct: "Monopoly", incorrect: ["Pay Day", "Cluedo", "Coppit"]),
        Trivia(q: "On a standard Monopoly board, how much do you have to pay for Tennessee Ave?", correct: "$180", incorrect: ["$200", "$160", "$220"]),
        Trivia(q: "In standard Monopoly, what's the rent if you land on Park Place with no houses?", correct: "$35", incorrect: ["$30", "$50", "$45"]),
        Trivia(q: "Which one of these is not a real game in the Dungeons & Dragons series?", correct: "Extreme Dungeons & Dragons", incorrect: ["Advanced Dungeons & Dragons", "Dungeons & Dragons 3.5th edition", "Advanced Dungeons & Dragons 2nd edition"]),
        Trivia(q: "The board game Monopoly takes its street names from which real American city?", correct: "Atlantic City, New Jersey", incorrect: ["Las Vegas, Nevada", "Duluth, Minnesota", "Charleston, South Carolina"]),
        Trivia(q: "Which board game was first released on February 6th, 1935?", correct: "Monopoly", incorrect: ["Risk", "Clue", "Candy Land"]),
        Trivia(q: "What do you declare in Rīchi Mahjong when you've drawn your winning tile?", correct: "Tsumo", incorrect: ["Ron", "Rīchi", "Kan"]),
        Trivia(q: "In Chess, the Queen has the combined movement of which two pieces?", correct: "Bishop and Rook", incorrect: ["Rook and King", "Knight and Bishop", "King and Knight"]),
        Trivia(q: "How many rooms are there, not including the hallways and the set of stairs, in the board game \"Clue\"?", correct: "9", incorrect: ["1", "6", "10"]),
        Trivia(q: "In Yu-Gi-Oh, how does a player perform an Xyz Summon?", correct: "Overlay at least 2 Monsters of the Same Level", incorrect: ["Activate a Spell and Send Monsters to the Graveyard", "Add the Monsters\' Levels Together to Match the Xyz Monster", "Banish A Number of Monsters From Your Hand And Deck"]),
        Trivia(q: "Which of the following tabletop games is the oldest?", correct: "Go", incorrect: ["Chess", "Mahjong", "Shogi"]),
        Trivia(q: "In which year was the pen and paper RPG \"Deadlands\" released?", correct: "1996", incorrect: ["2003", "1999", "1993"]),
        Trivia(q: "The board game \"Ra\" was designed by which designer? ", correct: "Reiner Knizia", incorrect: ["Bruno Cathala", "Uwe Rosenburg", "Allison Kline"]),
        Trivia(q: "What is the most challenging monster in the Dungeons & Dragons 5th Edition Monster Manual?", correct: "Tarrasque", incorrect: ["Beholder", "Displacer Beast", "Lich"]),
        Trivia(q: "The Dice Tower network of board game podcasts and videos is run by which individual?", correct: "Tom Vasel", incorrect: ["Jason LeVine", "Borth Sampson", "Uncle Pennybags"]),
        Trivia(q: "In \"Magic: The Gathering\", what instant card has the highest converted mana cost?", correct: "Blinkmoth Infusion", incorrect: ["Vitalizing Wind", "Chant of Vitu-Ghazi", "Assert Authority"]),
        Trivia(q: "In \"Magic: The Gathering\", during the design for Planar Chaos, what color did the developers think of adding in as the sixth color?", correct: "Purple", incorrect: ["Brown", "Pink", "Orange"]),
        Trivia(q: "What was the development code name for the \"Urza's Destiny\" expansion for \"Magic: The Gathering\", released in 1999?", correct: "Chimichanga", incorrect: ["Burrito", "Taquito", "Enchilada"]),
        Trivia(q: "Which ability from the \"Magic: The Gathering\" Scars of Mirrodin expansion involves having at least three artifacts in play?", correct: "Metalcraft", incorrect: ["Affinity", "Imprint", "Living Weapon"]),
        Trivia(q: "Some of the \"Fallen Empires\" cards from \"Magic: The Gathering\" were misprinted on the backs of which other card game?", correct: "Wyvern", incorrect: ["Pokemon", "Dominion", "Yu-Gi-Oh"]),
        Trivia(q: "Which of these cards from \"Magic: The Gathering\" has a flavor text that begins with \"Oi oi oi\"?", correct: "Uthden Troll", incorrect: ["Lotleth Troll", "Albino Troll", "Harvester Troll"]),
        Trivia(q: "Which card is on the cover of the Beta rulebook of \"Magic: The Gathering\"?", correct: "Bog Wraith", incorrect: ["Island", "Rock Hydra", "Elvish Archers"]),
        Trivia(q: "In Magic: The Gathering, what was a tribute card to Jamie Wakefield's late wife Marilyn, who loved horses?", correct: "Timbermare", incorrect: ["Loyal Pegasus", "Vryn Wingmare", "Sungrace Pegasus"]),
        Trivia(q: "When Magic: The Gathering was first solicited, which of the following was it originally titled?", correct: "Mana Clash", incorrect: ["Magic", "Magic Clash", "Mana Duels"]),
        Trivia(q: "In Magic: The Gathering, which of the following was the first publicly released foil card?", correct: "Lightning Dragon", incorrect: ["Revenant", "Beast of Burden", "Dirtcowl Wurm"]),
        Trivia(q: "In Magic: The Gathering, what term for blocking was established in the Portal set?", correct: "Intercepting", incorrect: ["Blocking", "Resisting", "Shielding"]),
        Trivia(q: "Europa Universalis is a strategy video game based on which French board game?", correct: "Europa Universalis", incorrect: ["Europe and the Universe", "Europa!", "Power in Europe"]),
        Trivia(q: "What Magic: The Gathering card's flavor text is just 'Ribbit.'?", correct: "Turn to Frog", incorrect: ["Spore Frog", "Bloated Toad", "Frogmite"]),
        Trivia(q: "In Magic: The Gathering, what card's flavor text is \"Catch!\"?", correct: "Lava Axe", incorrect: ["Stone-Throwing Devils", "Ember Shot", "Throwing Knife"]),
        Trivia(q: "When was the board game Twister, released to the public?", correct: "April 1966", incorrect: ["September 1965", "January 1969", "February 1966"]),
        Trivia(q: "Which character class in Dungeons and Dragons 5th edition gains it's powers from making a pact with a being of higher power?", correct: "Warlock", incorrect: ["Wizard", "Sorceror", "Cleric"]),
        Trivia(q: "In what year was the card game Magic: the Gathering first introduced?", correct: "1993", incorrect: ["1987", "1998", "2003"]),
        Trivia(q: "What is the sum of all the tiles in a standard box of Scrabble?", correct: "187", incorrect: ["207", "197", "177"]),
        Trivia(q: "In board games, an additional or ammended rule that applies to a certain group or place is informally known as a \"what\" rule?", correct: "House", incorrect: ["Custom", "Extra", "Change"]),
        Trivia(q: "What is the maximum level you can have in a single class in Dungeons and Dragons (5e)?", correct: "20", incorrect: ["30", "15", "25"]),
        Trivia(q: "In the Board Game, Settlers of Catan, a die roll of what number causes the Robber to attack? ", correct: "7", incorrect: ["3", "10", "1"]),
        ],

        //Science and nature - 7
        "Science & Nature" :
        [
        Trivia(q: "Which Apollo mission was the first one to land on the Moon?", correct: "Apollo 11", incorrect: ["Apollo 10", "Apollo 9", "Apollo 13"]),
        Trivia(q: "Which of the following bones is not in the leg?", correct: "Radius", incorrect: ["Patella", "Tibia", "Fibula "]),
        Trivia(q: "What is considered the rarist form of color blindness?", correct: "Blue", incorrect: ["Red", "Green", "Purple"]),
        Trivia(q: "Along with Oxygen, which element is primarily responsible for the sky appearing blue?", correct: "Nitrogen", incorrect: ["Helium", "Carbon", "Hydrogen"]),
        Trivia(q: "Which of these bones is hardest to break?", correct: "Femur", incorrect: ["Cranium", "Humerus", "Tibia"]),
        Trivia(q: "What is the colour of unoxidized blood?", correct: "Red", incorrect: ["Blue", "Purple", "Green"]),
        Trivia(q: "How many objects are equivalent to one mole?", correct: "6.022 x 10^23", incorrect: ["6.002 x 10^22", "6.022 x 10^22", "6.002 x 10^23"]),
        Trivia(q: "Which element has the chemical symbol 'Fe'?", correct: "Iron", incorrect: ["Gold", "Silver", "Tin"]),
        Trivia(q: "What name is given to all baby marsupials?", correct: "Joey", incorrect: ["Calf", "Pup", "Cub"]),
        Trivia(q: "The moons, Miranda, Ariel, Umbriel, Titania and Oberon orbit which planet?", correct: "Uranus", incorrect: ["Jupiter", "Venus", "Neptune"]),
        Trivia(q: "The humerus, paired radius, and ulna come together to form what joint?", correct: "Elbow", incorrect: ["Knee", "Sholder", "Ankle"]),
        Trivia(q: "What is the hottest planet in the Solar System?", correct: "Venus", incorrect: ["Mars", "Mercury", "Jupiter"]),
        Trivia(q: "What was the first living creature in space?", correct: "Fruit Flies ", incorrect: ["Monkey", "Dog", "Mouse"]),
        Trivia(q: "How many degrees Fahrenheit is 100 degrees Celsius? ", correct: "212", incorrect: ["326", "100", "451"]),
        Trivia(q: "How many planets make up our Solar System?", correct: "8", incorrect: ["7", "9", "6"]),
        Trivia(q: "All the following metal elements are liquids at or near room temperature EXCEPT:", correct: "Beryllium", incorrect: ["Gallium", "Caesium", "Mercury"]),
        Trivia(q: "What is the chemical makeup of water?", correct: "H20", incorrect: ["C12H6O2", "CO2", "H"]),
        Trivia(q: "What is the primary addictive substance found in tobacco?", correct: "Nicotine", incorrect: ["Cathinone", "Ephedrine", "Glaucine"]),
        Trivia(q: "What was the name of the first artificial Earth satellite, launched by the Soviet Union in 1957?", correct: "Sputnik 1", incorrect: ["Soyuz 7K-OK", "Zenit-2", "Voskhod 3KV"]),
        Trivia(q: "What is the scientific name of the red fox?", correct: "Vulpes Vulpes", incorrect: ["Vulpes Redus", "Red Fox", "Vulpes Vulpie"]),
        Trivia(q: "What does DNA stand for?", correct: "Deoxyribonucleic Acid", incorrect: ["Deoxyribogenetic Acid", "Deoxyribogenetic Atoms", "Detoxic Acid"]),
        Trivia(q: "Folic acid is the synthetic form of which vitamin?", correct: "Vitamin B", incorrect: ["Vitamin A", "Vitamin C", "Vitamin D"]),
        Trivia(q: "Which part of the body does glaucoma affect?", correct: "Eyes", incorrect: ["Throat", "Stomach", "Blood"]),
        Trivia(q: "What term is best associated with Sigmund Freud?", correct: "Psychoanalysis", incorrect: ["Cognitive-Behavioral Therapy", "Theory of Gravity", "Dialectical Behavior Therapy"]),
        Trivia(q: "What does the yellow diamond on the NFPA 704 fire diamond represent?", correct: "Reactivity", incorrect: ["Health", "Flammability", "Radioactivity"]),
        Trivia(q: "The human heart has how many chambers?", correct: "4", incorrect: ["2", "6", "3"]),
        Trivia(q: "The medical term for the belly button is which of the following?", correct: "Umbilicus", incorrect: ["Nevus", "Nares", "Paxillus"]),
        Trivia(q: "Which of these elements on the Periodic Table is a Noble Gas?", correct: "Neon", incorrect: ["Potassium", "Iodine", "Colbalt"]),
        Trivia(q: "About how old is Earth?", correct: "4.5 Billion Years", incorrect: ["3.5 Billion Years", "2.5 Billion Years", "5.5 Billion Years"]),
        Trivia(q: "What nucleotide pairs with guanine?", correct: "Cytosine", incorrect: ["Thymine", "Adenine", "Uracil"]),
        Trivia(q: "What does LASER stand for?", correct: "Light amplification by stimulated emission of radiation", incorrect: ["Lite analysing by stereo ecorazer", "Light amplifier by standby energy of radio", "Life antimatter by standing entry of range"]),
        Trivia(q: "What is radiation measured in?", correct: "Gray ", incorrect: ["Watt", "Decibel", "Kelvin"]),
        Trivia(q: "Botanically speaking, which of these fruits is NOT a berry?", correct: "Strawberry", incorrect: ["Blueberry", "Banana", "Concord Grape"]),
        Trivia(q: "How much radiation does a banana emit?", correct: "0.1 Microsievert", incorrect: ["0.3 Microsievert", "0.5 Microsievert", "0.7 Microsievert"]),
        Trivia(q: "Muscle fiber is constructed of bundles small long organelles called what?", correct: "Myofibrils", incorrect: ["Epimysium", "Myofiaments", "Myocardium"]),
        Trivia(q: "What are human nails made of?", correct: "Keratin", incorrect: ["Bone", "Chitin", "Calcium"]),
        Trivia(q: "How long is a light-year?", correct: "9.461 Trillion Kilometres", incorrect: ["1 AU", "105.40 Earth-years", "501.2 Million Miles"]),
        Trivia(q: "What part of the brain takes its name from the Greek for seahorse?", correct: "Hippocampus", incorrect: ["Cerebellum", "Thalamus", "Amygdala"]),
        Trivia(q: "Which planet did the \"Viking 1\" spacecraft send surface images of, starting in 1976?", correct: "Mars", incorrect: ["Saturn", "Jupiter", "Venus"]),
        Trivia(q: "Down Syndrome is usually caused by an extra copy of which chromosome?", correct: "21", incorrect: ["23", "15", "24"]),
        Trivia(q: "What is the scientific term for 'taste'?", correct: "Gustatory Perception", incorrect: ["Olfaction", "Somatosensation", "Auditory Perception"]),
        Trivia(q: "Which scientific unit is named after an Italian nobleman?", correct: "Volt", incorrect: ["Pascal", "Ohm", "Hertz"]),
        Trivia(q: "Which portion of the Marijuana plant produces the psychoactive substance known as THC?", correct: "Female Flower", incorrect: ["Leaves", "Male Flower", "Root Ball"]),
        Trivia(q: "Which of the following spacecraft never touched the moon?", correct: "Mariner 4", incorrect: ["Apollo 11", "Luna 2", "SMART-1"]),
        Trivia(q: "Deionized water is water with which of the following removed?", correct: "Iron", incorrect: ["Oxygen", "Hydrogen", "Uncharged atoms"]),
        Trivia(q: "Which of the following elements is typically used in the doping of the semiconductor silicon?", correct: "Boron", incorrect: ["Oxygen", "Carbon", "Iron"]),
        Trivia(q: "What is the name of the cognitive bias wherein a person with low ability in a particular skill mistake themselves as being superior?", correct: "Dunning-Kruger effect", incorrect: ["Meyers-Briggs effect", "Müller-Lyer effect", "Freud-Hall effect"]),
        Trivia(q: "Which of these Elements is a metalloid?", correct: "Antimony", incorrect: ["Tin", "Bromine", "Rubidium"]),
        Trivia(q: "What is the molecular formula of the active component of chili peppers(Capsaicin)?", correct: "C18H27NO3", incorrect: ["C21H23NO3", "C6H4Cl2", "C13H25NO4"]),
        Trivia(q: "In quantum physics, which of these theorised sub-atomic particles has yet to be observed?", correct: "Graviton", incorrect: ["Z boson", "Tau neutrino", "Gluon"]),
        ],

        //science computers - 7
        "Science: Computers" :
        [
        Trivia(q: "In any programming language, what is the most common way to iterate through an array?", correct: "'For' loops", incorrect: ["\'If\' Statements", "\'Do-while\' loops", "\'While\' loops"]),
        Trivia(q: "Which internet company began life as an online bookstore called 'Cadabra'?", correct: "Amazon", incorrect: ["eBay", "Overstock", "Shopify"]),
        Trivia(q: "What does the \"MP\" stand for in MP3?", correct: "Moving Picture", incorrect: ["Music Player", "Multi Pass", "Micro Point"]),
        Trivia(q: "According to the International System of Units, how many bytes are in a kilobyte of RAM?", correct: "1000", incorrect: ["512", "1024", "500"]),
        Trivia(q: "The programming language 'Swift' was created to replace what other programming language?", correct: "Objective-C", incorrect: ["C#", "Ruby", "C++"]),
        Trivia(q: "HTML is what type of language?", correct: "Markup Language", incorrect: ["Macro Language", "Programming Language", "Scripting Language"]),
        Trivia(q: "What five letter word is the motto of the IBM Computer company?", correct: "Think", incorrect: ["Click", "Logic", "Pixel"]),
        Trivia(q: "If you were to code software in this language you'd only be able to type 0's and 1's.", correct: "Binary", incorrect: ["JavaScript", "C++", "Python"]),
        Trivia(q: "The computer OEM manufacturer Clevo, known for its Sager notebook line, is based in which country?", correct: "Taiwan", incorrect: ["United States", "Germany", "China (People\'s Republic of)"]),
        Trivia(q: "What was the name given to Android 4.3?", correct: "Jelly Bean", incorrect: ["Lollipop", "Nutella", "Froyo"]),
        Trivia(q: "In web design, what does CSS stand for?", correct: "Cascading Style Sheet", incorrect: ["Counter Strike: Source", "Corrective Style Sheet", "Computer Style Sheet"]),
        Trivia(q: "What is the code name for the mobile operating system Android 7.0?", correct: "Nougat", incorrect: ["Ice Cream Sandwich", "Jelly Bean", "Marshmallow"]),
        Trivia(q: "What is the domain name for the country Tuvalu?", correct: ".tv", incorrect: [".tu", ".tt", ".tl"]),
        Trivia(q: "In the server hosting industry IaaS stands for...", correct: "Infrastructure as a Service", incorrect: ["Internet as a Service", "Internet and a Server", "Infrastructure as a Server"]),
        Trivia(q: "Which coding language was the #1 programming language in terms of usage on GitHub in 2015?", correct: "JavaScript", incorrect: ["C#", "Python", "PHP"]),
        Trivia(q: "In the programming language \"Python\", which of these statements would display the string \"Hello World\" correctly?", correct: "print(\"Hello World\")", incorrect: ["console.log(\\\"Hello World\\\")", "echo \\\"Hello World\\\"", "printf(\\\"Hello World\\\")"]),
        Trivia(q: "In \"Hexadecimal\", what color would be displayed from the color code? \"#00FF00\"?", correct: "Green", incorrect: ["Red", "Blue", "Yellow"]),
        Trivia(q: "What is the correct term for the metal object in between the CPU and the CPU fan within a computer system?", correct: "Heat Sink", incorrect: ["CPU Vent", "Temperature Decipator", "Heat Vent"]),
        Trivia(q: "In programming, the ternary operator is mostly defined with what symbol(s)?", correct: "?:", incorrect: ["??", "if then", "?"]),
        Trivia(q: "Which computer language would you associate Django framework with?", correct: "Python", incorrect: ["C#", "C++", "Java"]),
        Trivia(q: "What does LTS stand for in the software market?", correct: "Long Term Support", incorrect: ["Long Taco Service", "Ludicrous Transfer Speed", "Ludicrous Turbo Speed"]),
        Trivia(q: "In computing terms, typically what does CLI stand for?", correct: "Command Line Interface", incorrect: ["Common Language Input", "Control Line Interface", "Common Language Interface"]),
        Trivia(q: "Which operating system was released first?", correct: "Mac OS", incorrect: ["Windows", "Linux", "OS/2"]),
        Trivia(q: ".rs is the top-level domain for what country?", correct: "Serbia", incorrect: ["Romania", "Russia", "Rwanda"]),
        Trivia(q: "What does the term GPU stand for?", correct: "Graphics Processing Unit", incorrect: ["Gaming Processor Unit", "Graphite Producing Unit", "Graphical Proprietary Unit"]),
        Trivia(q: "America Online (AOL) started out as which of these online service providers?", correct: "Quantum Link", incorrect: ["CompuServe", "Prodigy", "GEnie"]),
        Trivia(q: "What is the main CPU is the Sega Mega Drive / Sega Genesis?", correct: "Motorola 68000", incorrect: ["Zilog Z80", "Yamaha YM2612", "Intel 8088"]),
        Trivia(q: "What was the first Android version specifically optimized for tablets?", correct: "Honeycomb", incorrect: ["Eclair", "Froyo", "Marshmellow"]),
        Trivia(q: "Which RAID array type is associated with data mirroring?", correct: "RAID 1", incorrect: ["RAID 0", "RAID 10", "RAID 5"]),
        Trivia(q: "When did the online streaming service \"Mixer\" launch?", correct: "2016", incorrect: ["2013", "2009", "2011"]),
        Trivia(q: "What does the term MIME stand for, in regards to computing?", correct: "Multipurpose Internet Mail Extensions", incorrect: ["Mail Internet Mail Exchange", "Multipurpose Interleave Mail Exchange", "Mail Interleave Method Exchange"]),
        Trivia(q: "Released in 2001, the first edition of Apple's Mac OS X operating system (version 10.0) was given what animal code name?", correct: "Cheetah", incorrect: ["Puma", "Tiger", "Leopard"]),
        Trivia(q: "Dutch computer scientist Mark Overmars is known for creating which game development engine?", correct: "Game Maker", incorrect: ["Stencyl", "Construct", "Torque 2D"]),
        Trivia(q: "The C programming language was created by this American computer scientist. ", correct: "Dennis Ritchie", incorrect: ["Tim Berners Lee", "al-Khwārizmī", "Willis Ware"]),
        Trivia(q: "The name of technology company HP stands for what?", correct: "Hewlett-Packard", incorrect: ["Howard Packmann", "Husker-Pollosk", "Hellman-Pohl"]),
        Trivia(q: "What is the name given to layer 4 of the Open Systems Interconnection (ISO) model?", correct: "Transport", incorrect: ["Session", "Data link", "Network"]),
        Trivia(q: "What vulnerability ranked #1 on the OWASP Top 10 in 2013?", correct: "Injection ", incorrect: ["Broken Authentication", "Cross-Site Scripting", "Insecure Direct Object References"]),
        Trivia(q: "Who invented the \"Spanning Tree Protocol\"?", correct: "Radia Perlman", incorrect: ["Paul Vixie", "Vint Cerf", "Michael Roberts"]),
        Trivia(q: "Approximately how many Apple I personal computers were created?", correct: "200", incorrect: ["100", "500", "1000"]),
        Trivia(q: "What does RAID stand for?", correct: "Redundant Array of Independent Disks", incorrect: ["Rapid Access for Indexed Devices", "Range of Applications with Identical Designs", "Randomized Abstract Identification Description"]),
        Trivia(q: "In computing, what does MIDI stand for?", correct: "Musical Instrument Digital Interface", incorrect: ["Musical Interface of Digital Instruments", "Modular Interface of Digital Instruments", "Musical Instrument Data Interface"]),
        Trivia(q: "In computing, what does LAN stand for?", correct: "Local Area Network", incorrect: ["Long Antenna Node", "Light Access Node", "Land Address Navigation"]),
        Trivia(q: "What major programming language does Unreal Engine 4 use?", correct: "C++", incorrect: ["Assembly", "C#", "ECMAScript"]),
        Trivia(q: "Which of these is not a layer in the OSI model for data communications?", correct: "Connection Layer", incorrect: ["Application Layer", "Transport Layer", "Physical Layer"]),
        Trivia(q: "What type of sound chip does the Super Nintendo Entertainment System (SNES) have?", correct: "ADPCM Sampler", incorrect: ["FM Synthesizer", "Programmable Sound Generator (PSG)", "PCM Sampler"]),
        Trivia(q: "How many bits make up the significand portion of a single precision floating point number?", correct: "23", incorrect: ["8", "53", "15"]),
        Trivia(q: "What language does Node.js use?", correct: "JavaScript", incorrect: ["Java", "Java Source", "Joomla Source Code"]),
        Trivia(q: "Which of these Cherry MX mechanical keyboard switches is both tactile and clicky?", correct: "Cherry MX Blue", incorrect: ["Cherry MX Black", "Cherry MX Red", "Cherry MX Brown"]),
        Trivia(q: "Who is the founder of Palantir?", correct: "Peter Thiel", incorrect: ["Mark Zuckerberg", "Marc Benioff", "Jack Dorsey"]),
        Trivia(q: "What does the computer software acronym JVM stand for?", correct: "Java Virtual Machine", incorrect: ["Java Vendor Machine", "Java Visual Machine", "Just Virtual Machine"]),
        ],

        //sports - 8
        "Sports" :
        [
        Trivia(q: "Which of the following sports is not part of the triathlon?", correct: "Horse-Riding", incorrect: ["Cycling", "Swimming", "Running"]),
        Trivia(q: "At which bridge does the annual Oxford and Cambridge boat race start?", correct: "Putney", incorrect: ["Hammersmith", "Vauxhall ", "Battersea"]),
        Trivia(q: "With which team did Michael Schumacher make his Formula One debut at the 1991 Belgian Grand Prix?", correct: "Jordan", incorrect: ["Benetton", "Ferrari", "Mercedes"]),
        Trivia(q: "Which German sportswear company's logo is the 'Formstripe'?", correct: "Puma", incorrect: ["Nike", "Adidas", "Reebok"]),
        Trivia(q: "Which English football club has the nickname 'The Foxes'?", correct: "Leicester City", incorrect: ["Northampton Town", "Bradford City", "West Bromwich Albion"]),
        Trivia(q: "Which Formula One driver was nicknamed 'The Professor'?", correct: "Alain Prost", incorrect: ["Ayrton Senna", "Niki Lauda", "Emerson Fittipaldi"]),
        Trivia(q: "In a game of snooker, what colour ball is worth 3 points?", correct: "Green", incorrect: ["Yellow", "Brown", "Blue"]),
        Trivia(q: "With which doubles partner did John McEnroe have most success?", correct: "Peter Fleming", incorrect: ["Mark Woodforde", "Michael Stich", "Mary Carillo"]),
        Trivia(q: "Which nation hosted the FIFA World Cup in 2006?", correct: "Germany", incorrect: ["United Kingdom", "Brazil", "South Africa"]),
        Trivia(q: "The Rio 2016 Summer Olympics held it's closing ceremony on what date?", correct: "August 21", incorrect: ["August 23", "August 19", "August 17"]),
        Trivia(q: "Which country is hosting the 2022 FIFA World Cup?", correct: "Qatar", incorrect: ["Uganda", "Vietnam", "Bolivia"]),
        Trivia(q: "Which driver has been the Formula 1 world champion for a record 7 times?", correct: "Michael Schumacher", incorrect: ["Ayrton Senna", "Fernando Alonso", "Jim Clark"]),
        Trivia(q: "Where was the Games of the XXII Olympiad held?", correct: "Moscow", incorrect: ["Barcelona", "Tokyo", "Los Angeles"]),
        Trivia(q: "Josh Mansour is part of what NRL team?", correct: "Penrith Panthers", incorrect: ["Melbourne Storm", "Sydney Roosters", "North Queensland Cowboys"]),
        Trivia(q: "Which female player won the gold medal of table tennis singles in 2016 Olympics Games?", correct: "DING Ning (China)", incorrect: ["LI Xiaoxia (China)", "Ai FUKUHARA (Japan)", "Song KIM (North Korea)"]),
        Trivia(q: "Which soccer team won the Copa América 2015 Championship ?", correct: "Chile", incorrect: ["Argentina", "Brazil", "Paraguay"]),
        Trivia(q: "Which team won 2014 FIFA World Cup in Brazil?", correct: "Germany", incorrect: ["Argentina", "Brazil", "Netherlands"]),
        Trivia(q: "How many points did LeBron James score in his first NBA game?", correct: "25", incorrect: ["19", "69", "41"]),
        Trivia(q: "What national team won the 2016 edition of UEFA European Championship?", correct: "Portugal", incorrect: ["France", "Germany", "England"]),
        Trivia(q: "In Baseball, how many times does the ball have to be pitched outside of the strike zone before the batter is walked?", correct: "4", incorrect: ["1", "2", "3"]),
        Trivia(q: "In 2016, who won the Formula 1 World Constructor's Championship for the third time in a row?", correct: "Mercedes-AMG Petronas", incorrect: ["Scuderia Ferrari", "McLaren Honda", "Red Bull Racing Renault"]),
        Trivia(q: "What team won the 2016 MLS Cup?", correct: "Seattle Sounders", incorrect: ["Colorado Rapids", "Toronto FC", "Montreal Impact"]),
        Trivia(q: "What is the oldest team in the NFL?", correct: "Arizona Cardinals", incorrect: ["Chicago Bears", "Green Bay Packers", "New York Giants"]),
        Trivia(q: "What is the oldest team in Major League Baseball?", correct: "Atlanta Braves", incorrect: ["Chicago Cubs", "Cincinnati Reds", "St. Louis Cardinals"]),
        Trivia(q: "Which of the following Grand Slam tennis tournaments occurs LAST?", correct: "US Open", incorrect: ["French Open", "Wimbledon", "Australian Open"]),
        Trivia(q: "What year did the New Orleans Saints win the Super Bowl?", correct: "2010", incorrect: ["2008", "2009", "2011"]),
        Trivia(q: "This Canadian television sportscaster is known for his \"Hockey Night in Canada\" role, a commentary show during hockey games.", correct: "Don Cherry", incorrect: ["Don McKellar", "Don Taylor ", "Donald Sutherland"]),
        Trivia(q: "Which portuguese island is soccer player Cristiano Ronaldo from?", correct: "Madeira", incorrect: ["Terceira", "Santa Maria", "Porto Santo"]),
        Trivia(q: "Who won the 2015 College Football Playoff (CFP) National Championship? ", correct: "Ohio State Buckeyes", incorrect: ["Alabama Crimson Tide", "Clemson Tigers", "Wisconsin Badgers"]),
        Trivia(q: "What year was hockey legend Wayne Gretzky born?", correct: "1961", incorrect: ["1965", "1959", "1963"]),
        Trivia(q: "Which year was the third Super Bowl held?", correct: "1969", incorrect: ["1968", "1971", "1970"]),
        Trivia(q: "When was the first official international game played?", correct: "1872", incorrect: ["1880", "1863", "1865"]),
        Trivia(q: "Which boxer was banned for taking a bite out of Evander Holyfield's ear in 1997?", correct: "Mike Tyson", incorrect: ["Roy Jones Jr.", "Evander Holyfield", "Lennox Lewis"]),
        Trivia(q: "What is the most common type of pitch thrown by pitchers in baseball?", correct: "Fastball", incorrect: ["Slowball", "Screwball", "Palmball"]),
        Trivia(q: "How many French Open's did Björn Borg win?", correct: "6", incorrect: ["4", "9", "2"]),
        Trivia(q: "Which player holds the NHL record of 2,857 points?", correct: "Wayne Gretzky", incorrect: ["Mario Lemieux ", "Sidney Crosby", "Gordie Howe"]),
        Trivia(q: "Which city features all of their professional sports teams' jersey's with the same color scheme?", correct: "Pittsburgh", incorrect: ["New York", "Seattle", "Tampa Bay"]),
        Trivia(q: "When was the FC Schalke 04 founded?", correct: "1904", incorrect: ["1909", "2008", "1999"]),
        Trivia(q: "The Los Angeles Dodgers were originally from what U.S. city?", correct: "Brooklyn", incorrect: ["Las Vegas", "Boston", "Seattle"]),
        Trivia(q: "Which year did Jenson Button won his first ever Formula One World Drivers' Championship?", correct: "2009", incorrect: ["2010", "2007", "2006"]),
        Trivia(q: "Who won the 2017 Formula One World Drivers' Championship?", correct: "Lewis Hamilton", incorrect: ["Sebastian Vettel", "Nico Rosberg", "Max Verstappen"]),
        Trivia(q: "Which Formula 1 driver switched teams in the middle of the 2017 season?", correct: "Carlos Sainz Jr.", incorrect: ["Daniil Kvyat", "Jolyon Palmer", "Rio Haryanto"]),
        Trivia(q: "In the 2014 FIFA World Cup, what was the final score in the match Brazil - Germany?", correct: "1-7", incorrect: ["1-5", "1-6", "2-6"]),
        Trivia(q: "Which two teams played in Super Bowl XLII?", correct: "The New York Giants & The New England Patriots", incorrect: ["The Green Bay Packers & The Pittsburgh Steelers", "The Philadelphia Eagles & The New England Patriots", "The Seattle Seahawks & The Denver Broncos"]),
        Trivia(q: "What country hosted the 2014 Winter Olympics?", correct: "Russia", incorrect: ["Canada", "United States", "Germany"]),
        Trivia(q: "Which NBA player has the most games played over the course of their career?", correct: "Robert Parish", incorrect: ["Kareem Abdul-Jabbar", "Kevin Garnett", "Kobe Bryant"]),
        Trivia(q: "Which basketball team has attended the most NBA grand finals?", correct: "Los Angeles Lakers", incorrect: ["Boston Celtics", "Philadelphia 76ers", "Golden State Warriors"]),
        Trivia(q: "Which of these Russian cities did NOT contain a stadium that was used in the 2018 FIFA World Cup?", correct: "Vladivostok", incorrect: ["Rostov-on-Don", "Yekaterinburg", "Kaliningrad"]),
        Trivia(q: "The AHL affiliate team of the Boston Bruins is named what?", correct: "Providence Bruins", incorrect: ["New Haven Bruins", "Cambridge Bruins", "Hartford Bruins"]),
        Trivia(q: "Which English football team is nicknamed 'The Tigers'?", correct: "Hull City", incorrect: ["Cardiff City", "Bristol City", "Manchester City"]),
        ],

        
        //Georgraphy
        "Geography" :
        [
        Trivia(q: "The body of the Egyptian Sphinx was based on which animal?", correct: "Lion", incorrect: ["Bull", "Horse", "Dog"]),
        Trivia(q: "What is the capital of Peru?", correct: "Lima", incorrect: ["Santiago", "Montevideo", "Buenos Aires"]),
        Trivia(q: "The Principality of Sealand is an unrecognized micronation off the coast of what country?", correct: "The United Kingdom", incorrect: ["Japan", "Austrailia", "Argentina"]),
        Trivia(q: "Which of these countries is \"doubly landlocked\" (surrounded entirely by one or more landlocked countries)?", correct: "Uzbekistan", incorrect: ["Switzerland", "Bolivia", "Ethiopia"]),
        Trivia(q: "Which country does Austria not border?", correct: "France", incorrect: ["Slovenia", "Switzerland", "Slovakia"]),
        Trivia(q: "What is the capital of Jamaica?", correct: "Kingston", incorrect: ["San Juan", "Port-au-Prince", "Bridgetown"]),
        Trivia(q: "What colour is the circle on the Japanese flag?", correct: "Red", incorrect: ["White", "Yellow", "Black"]),
        Trivia(q: "What is the capital of Denmark?", correct: "Copenhagen", incorrect: ["Aarhus", "Odense", "Aalborg"]),
        Trivia(q: "Which of the following countries is within the Eurozone but outside of the Schengen Area?", correct: "Cyprus", incorrect: ["Malta", "Greece", "Portugal"]),
        Trivia(q: "Which of these countries is located the FURTHEST away from the South China Sea?", correct: "Bangladesh", incorrect: ["Malaysia", "Vietnam", "Philippines"]),
        Trivia(q: "The World Health Organization headquarters is located in which European country?", correct: "Switzerland", incorrect: ["United Kingdom", "France", "Belgium"]),
        Trivia(q: "What is the official language of Costa Rica?", correct: "Spanish", incorrect: ["English", "Portuguese", "Creole"]),
        Trivia(q: "How many countries are larger than Australia?", correct: "5", incorrect: ["4", "3", "6"]),
        Trivia(q: "What is the largest lake in the African continent?", correct: "Lake Victoria", incorrect: ["Lake Tanganyika", "Lake Malawi", "Lake Turkana"]),
        Trivia(q: "Which UK country features a dragon on their flag?", correct: "Wales", incorrect: ["England", "North Ireland", "Scotland"]),
        Trivia(q: "How many countries border Kyrgyzstan?", correct: "4", incorrect: ["3", "1", "6"]),
        Trivia(q: "What is the right way to spell the capital of Hungary?", correct: "Budapest", incorrect: ["Boodapest", "Bhudapest", "Budapast"]),
        Trivia(q: "Where is the fast food chain \"Panda Express\" headquartered?", correct: "Rosemead, California", incorrect: ["Sacramento, California", "Fresno, California", "San Diego, California"]),
        Trivia(q: "Llanfair­pwllgwyngyll­gogery­chwyrn­drobwll­llan­tysilio­gogo­goch is located on which Welsh island?", correct: "Anglesey", incorrect: ["Barry", "Bardsey", "Caldey"]),
        Trivia(q: "Which country was NOT formerly part of Yugoslavia?", correct: "Albania", incorrect: ["Croatia", "Serbia", "Macedonia"]),
        Trivia(q: "What tiny principality lies between Spain and France?", correct: "Andorra", incorrect: ["Liechtenstein", "Monaco", "San Marino"]),
        Trivia(q: "The towns of Brugelette, Arlon and Ath are located in which country?", correct: "Belgium", incorrect: ["Andorra", "France", "Luxembourg"]),
        Trivia(q: "What is the capital of Slovakia?", correct: "Bratislava", incorrect: ["Sofia", "Ljubljana", "Sarajevo"]),
        Trivia(q: "Which country is the home of the largest Japanese population outside of Japan?", correct: "Brazil", incorrect: ["China", "Russia", "The United States"]),
        Trivia(q: "What is the Finnish word for \"Finland\"?", correct: "Suomi", incorrect: ["Eesti", "Magyarország", "Sverige"]),
        Trivia(q: "Which Canadian province has Charlottetown as its capital?", correct: "Prince Edward Island", incorrect: ["Saskachewan", "Northwest Terrirories", "Ontario"]),
        Trivia(q: "What is the name of the formerly rich fishing grounds off the island of Newfoundland, Canada?", correct: "Grand Banks", incorrect: ["Great Barrier Reef", "Mariana Trench", "Hudson Bay"]),
        Trivia(q: "Which one of these countries borders with Poland?", correct: "Lithuania", incorrect: ["France", "Norway", "Netherlands"]),
        Trivia(q: "When does Finland celebrate their independence day?", correct: "December 6th", incorrect: ["January 2nd", "November 12th", "February 8th"]),
        Trivia(q: "Which of the following Japanese islands is the biggest?", correct: "Honshu", incorrect: ["Hokkaido", "Shikoku", "Kyushu"]),
        Trivia(q: "What is the capital of Belarus?", correct: "Minsk", incorrect: ["Warsaw", "Kiev", "Vilnius"]),
        Trivia(q: "What is the smallest country in the world?", correct: "Vatican City", incorrect: ["Maldives", "Monaco", "Malta"]),
        Trivia(q: "In the 2016 Global Peace Index poll, out of 163 countries, what was the United States of America ranked?", correct: "103", incorrect: ["10", "59", "79"]),
        Trivia(q: "What city has the busiest airport in the world?", correct: "Atlanta, Georgia USA", incorrect: ["London, England", "Chicago,Illinois ISA", "Tokyo,Japan"]),
        Trivia(q: "What is the fifth largest country by area?", correct: "Brazil", incorrect: ["United States", "Australia", "India"]),
        Trivia(q: "What is the capital of Mauritius?", correct: "Port Louis", incorrect: ["Port Moresby", "Port Vila", "Port-au-Prince"]),
        Trivia(q: "Colchester Overpass, otherwise known as \"Bunny Man Bridge\", is located where?", correct: "Fairfax County, Virginia", incorrect: ["Medford, Oregon", "Braxton County, Virgina", "Lemon Grove, California"]),
        Trivia(q: "What is the most common climbing route for the second highest mountain in the world, K2?", correct: "Abruzzi Spur", incorrect: ["Magic Line", "Cesen Route", "Polish Line"]),
        Trivia(q: "How many rivers are in Saudi Arabia?", correct: "0", incorrect: ["1", "2", "3"]),
        Trivia(q: "Which of the following is NOT a capital city?", correct: "Sydney", incorrect: ["Cairo", "Moscow", "Beijing"]),
        Trivia(q: "The emblem on the flag of the Republic of Tajikistan features a sunrise over mountains below what symbol?", correct: "Crown", incorrect: ["Bird", "Sickle", "Tree"]),
        Trivia(q: "Bridgetown is the capital of which island country in the Carribean?", correct: "Barbados", incorrect: ["Cuba", "Jamaica‎", "Dominica"]),
        Trivia(q: "What is the name of the only remaining Grand Duchy in the world ?", correct: "Luxembourg", incorrect: ["Montenegro", "Liechtenstein", "Andorra"]),
        Trivia(q: "What is the northernmost human settlement with year round inhabitants?", correct: "Alert, Canada", incorrect: ["Nagurskoye, Russia", "McMurdo Station, Antarctica ", "Honningsvåg, Norway"]),
        Trivia(q: "How many time zones are in Russia?", correct: "11", incorrect: ["8", "5", "2"]),
        Trivia(q: "The longest shared border in the world can be found between which two nations?", correct: "Canada and the United States", incorrect: ["Chile and Argentina", "Russia and China", "India and Pakistan"]),
        Trivia(q: "Which of these Japanese islands is the largest by area?", correct: "Shikoku", incorrect: ["Iki", "Odaiba", "Okinawa"]),
        Trivia(q: "Which of these countries is not a United Nations member state?", correct: "Niue", incorrect: ["Tuvalu", "South Sudan", "Montenegro"]),
        Trivia(q: "What was the African nation of Zimbabwe formerly known as?", correct: "Rhodesia", incorrect: ["Zambia", "Mozambique", "Bulawayo"]),
        Trivia(q: "What is the largest country in the world ?", correct: "Russian Federation", incorrect: ["China", "Canada", "Brazil"]),
        ],

        "History" :
        [
        Trivia(q: "During the Mongolian invasions of Japan, what were the Mongol boats mostly stopped by?", correct: "Typhoons", incorrect: ["Tornados", "Economic depression", "Samurai"]),
        Trivia(q: "In what year did Neil Armstrong and Buzz Aldrin land on the moon?", correct: "1969", incorrect: ["1965", "1966", "1973"]),
        Trivia(q: "America's Strategic Defense System during the Cold War was nicknamed after this famous movie.", correct: "Star Wars", incorrect: ["Jaws", "Blade Runner", "Alien"]),
        Trivia(q: "Which of the following African countries was most successful in resisting colonization?", correct: "Ethiopia", incorrect: ["Côte d’Ivoire", "Congo", "Namibia"]),
        Trivia(q: "According to scholarly estimates, what percentage of the world population at the time died due to Tamerlane's conquests?", correct: "5%", incorrect: ["1%", "3%", "<1%"]),
        Trivia(q: "Which famous world leader is famed for the saying, \"Let them eat cake\", yet is rumored that he/she never said it at all?", correct: "Marie Antoinette", incorrect: ["Czar Nicholas II", "Elizabeth I", "Henry VIII"]),
        Trivia(q: "The creator of the Enigma Cypher and Machine was of what nationality?", correct: "German", incorrect: ["American", "British", "Polish"]),
        Trivia(q: "When was the United States National Security Agency established?", correct: "November 4, 1952", incorrect: ["July 26, 1908", "July 1, 1973", "November 25, 2002"]),
        Trivia(q: "Which Apollo mission was the last one in NASA's Apollo program?", correct: "Apollo 17", incorrect: ["Apollo 13", "Apollo 11", "Apollo 15"]),
        Trivia(q: "What did the first vending machines in the early 1880's dispense?", correct: "Post cards", incorrect: ["Alcohol", "Cigarettes", "Sodas "]),
        Trivia(q: "In what prison was Adolf Hitler held in 1924?", correct: "Landsberg Prison", incorrect: ["Spandau Prison", "Ebrach Abbey", "Hohenasperg"]),
        Trivia(q: "When was the SS or Schutzstaffel established?", correct: "April 4th, 1925", incorrect: ["September 1st, 1941", "March 8th, 1935", "February 21st, 1926"]),
        Trivia(q: "During the Wars of the Roses (1455 - 1487) which Englishman was dubbed \"the Kingmaker\"?", correct: "Richard Neville", incorrect: ["Richard III", "Henry V", "Thomas Warwick"]),
        Trivia(q: "When did the Battle of the Somme begin?", correct: "July 1st, 1916", incorrect: ["August 1st, 1916", "July 2nd, 1916", "June 30th, 1916"]),
        Trivia(q: "What year were the Marian Reforms instituted in the Roman Republic?", correct: "107 BCE", incorrect: ["42 BCE", "264 BCE", "102 CE"]),
        Trivia(q: "What was the real name of the Albanian national leader Skanderbeg?", correct: "Gjergj Kastrioti", incorrect: ["Diturak Zhulati", "Iskander Bejko", "Mirash Krasniki"]),
        Trivia(q: "Which WWII tank ace is credited with having destroyed the most tanks?", correct: "Kurt Knispel", incorrect: ["Michael Wittmann", "Walter Kniep", "Otto Carius"]),
        Trivia(q: "What was the transfer of disease, crops, and people across the Atlantic shortly after the discovery of the Americas called?", correct: "The Columbian Exchange", incorrect: ["Triangle Trade", "Transatlantic Slave Trade", "The Silk Road"]),
        Trivia(q: "What is the mnemonic device for remembering the fates of the wives of Henry VIII?", correct: "Divorced, Beheaded, Died, Divorced, Beheaded, Survived", incorrect: ["Beheaded, Died, Divorced, Divorced, Beheaded, Survived", "Died, Beheaded, Divorced, Beheaded, Survived, Divorced", "Survived, Beheaded, Died, Divorced, Divorced, Beheaded"]),
        Trivia(q: "What was Genghis Khan's real name?", correct: "Temüjin", incorrect: ["Möngke", "Ögedei", "Temür"]),
        Trivia(q: "Which American civilization is the source of the belief that the world would end or drastically change on December 21st, 2012?", correct: "The Mayans", incorrect: ["The Incas", "The Aztecs", "The Navajos"]),
        Trivia(q: "The Battle of Hastings was fought in which year?", correct: "1066", incorrect: ["911", "1204", "1420"]),
        Trivia(q: "When Christopher Columbus sailed to America, what was the first region he arrived in?", correct: "The Bahamas Archipelago", incorrect: ["Florida", "Isthmus of Panama", "Nicaragua"]),
        Trivia(q: "Which historical conflict killed the most people?", correct: "World War II", incorrect: ["Taiping Rebellion", "Three Kingdoms War", "Mongol conquests"]),
        Trivia(q: "When did the United States formally declare war on Japan, entering World War II?", correct: "December 8, 1941", incorrect: ["June 6, 1944", "June 22, 1941", "September 1, 1939"]),
        Trivia(q: "In 1939, Britain and France declared war on Germany after it invaded which country?", correct: "Poland", incorrect: ["Czechoslovakia", "Austria", "Hungary"]),
        Trivia(q: "What was the total length of the Titanic?", correct: "882 ft | 268.8 m", incorrect: ["759 ft | 231.3 m", "1042 ft | 317.6 m", "825 ft | 251.5 m"]),
        Trivia(q: "In what year did the Berlin Wall fall?", correct: "1989", incorrect: ["1987", "1991", "1993"]),
        Trivia(q: "Which country was an allied power in World War II?", correct: "Soviet Union", incorrect: ["Italy", "Germany", "Japan"]),
        Trivia(q: "When was the \"Siege of Leningrad\" lifted during World War II?", correct: "January 1944", incorrect: ["September 1943", "November 1943", "March 1944"]),
        Trivia(q: "In 1961, an American B-52 aircraft crashed and nearly detonated two 4mt nuclear bombs over which US city?", correct: "Goldsboro, North Carolina", incorrect: ["Hicksville, New York", "Jacksonville, Florida", "Conway, Arkansas"]),
        Trivia(q: "How many years did the Hundred Years' War last?", correct: "116", incorrect: ["100", "90", "101"]),
        Trivia(q: "What is the name of the ship which was only a few miles away from the RMS Titanic when it struck an iceberg on April 14, 1912?", correct: "Californian", incorrect: ["Carpathia", "Cristol", "Commerce"]),
        Trivia(q: "What was the code name for the German invasion of the Soviet Union in WW2?", correct: "Operation Barbarossa", incorrect: ["Operation Kaiserschlact", "Operation Unthinkable", "Operation Molotov"]),
        Trivia(q: "What was the last colony the UK ceded marking the end of the British Empire?", correct: "Hong Kong", incorrect: ["India", "Australia", "Ireland"]),
        Trivia(q: "Which of the following Presidents of the United States was assassinated?", correct: "William McKinley", incorrect: ["Lyndon Johnson", "Chester Arthur", "Franklin Roosevelt"]),
        Trivia(q: "From 1940 to 1942, what was the capital-in-exile of Free France ?", correct: "Brazzaville", incorrect: ["Algiers", "Paris", "Tunis"]),
        Trivia(q: "The ancient city of Chichén Itzá was built by which civilization?", correct: "Mayans", incorrect: ["Aztecs", "Incas", "Toltecs"]),
        Trivia(q: "Which countries participated in the Lobster War?", correct: "France and Brazil", incorrect: ["Canada and Norway", "Australia and New Zealand", "United States and England"]),
        Trivia(q: "Which of the following is not in the Indo-European language family?", correct: "Finnish", incorrect: ["English", "Hindi", "Russian"]),
        Trivia(q: "During World War I, which nation's monarchs were blood related?", correct: "England, Germany, Russia", incorrect: ["France, Russia, Germany", "Serbia, Russia, Croatia", "Germany, Spain, Austria"]),
        Trivia(q: "When did O, Canada officially become the national anthem?", correct: "1980", incorrect: ["1950", "1920", "1880"]),
        Trivia(q: "Who was the last Roman emperor in the Year of Four Emperors (69 AD)?", correct: "Vespasian", incorrect: ["Vitellius", "Otho", "Galba"]),
        Trivia(q: "What does the United States of America celebrate during the 4th of July?", correct: "The signing of the Declaration of Independence", incorrect: ["The anniversary of the Battle of Gettysburg", "The crossing of the Delaware River", "The ratification of the Constitution"]),
        Trivia(q: "Who rode on horseback to warn the Minutemen that the British were coming during the U.S. Revolutionary War?", correct: "Paul Revere", incorrect: ["Thomas Paine", "Henry Longfellow", "Nathan Hale"]),
        Trivia(q: "After his loss at the Battle of Waterloo, Napoleon Bonaparte was exiled to which island?", correct: "St. Helena", incorrect: ["Elba", "Corsica", "Canary"]),
        Trivia(q: "Which of the following physicists did NOT work on the Manhattan project?", correct: "Murray Gell-Mann", incorrect: ["Richard Feynman", "J. Robert Oppenheimer", "John Von-Neumann"]),
        Trivia(q: "The Ottoman Empire was dissolved after their loss in which war?", correct: "World War I", incorrect: ["Crimean War", "Serbian Revolution", "Second Balkan War"]),
        Trivia(q: "Which country did the Eureka Rebellion, an 1856 battle against colonial rule, take place in?", correct: "Australia", incorrect: ["India", "Canada", "Brazil"]),
        Trivia(q: "Who is the creator of the soft drink, Dr. Pepper?", correct: "Charles Alderton", incorrect: ["James Wellington", "Johnson Hinsin", "Boris Heviltik"]),
        ],

        //animals
        "Animals" :
        [
        Trivia(q: "What was the name of the Ethiopian Wolf before they knew it was related to wolves?", correct: "Simien Jackel", incorrect: ["Ethiopian Coyote", "Amharic Fox", "Canis Simiensis"]),
        Trivia(q: "What does \"hippopotamus\" mean and in what langauge?", correct: "River Horse (Greek)", incorrect: ["River Horse (Latin)", "Fat Pig (Greek)", "Fat Pig (Latin)"]),
        Trivia(q: "A carnivorous animal eats flesh, what does a nucivorous animal eat?", correct: "Nuts", incorrect: ["Nothing", "Fruit", "Seaweed"]),
        Trivia(q: "What type of animal is a natterjack?", correct: "Toad", incorrect: ["Bird", "Fish", "Insect"]),
        Trivia(q: "What is the fastest land animal?", correct: "Cheetah", incorrect: ["Lion", "Thomson’s Gazelle", "Pronghorn Antelope"]),
        Trivia(q: "What is the scientific name for modern day humans?", correct: "Homo Sapiens", incorrect: ["Homo Ergaster", "Homo Erectus", "Homo Neanderthalensis"]),
        Trivia(q: "The Kākāpō is a large, flightless, nocturnal parrot native to which country?", correct: "New Zealand", incorrect: ["South Africa", "Australia", "Madagascar"]),
        Trivia(q: "Which species of Brown Bear is not extinct?", correct: "Syrian Brown Bear", incorrect: ["California Grizzly Bear", "Atlas Bear", "Mexican Grizzly Bear"]),
        Trivia(q: "What color/colour is a polar bear's skin?", correct: "Black", incorrect: ["White", "Pink", "Green"]),
        Trivia(q: "Hippocampus is the Latin name for which marine creature?", correct: "Seahorse", incorrect: ["Dolphin", "Whale", "Octopus"]),
        Trivia(q: "Cashmere is the wool from which kind of animal?", correct: "Goat", incorrect: ["Sheep", "Camel", "Llama"]),
        Trivia(q: "What is the scientific name for the \"Polar Bear\"?", correct: "Ursus Maritimus", incorrect: ["Polar Bear", "Ursus Spelaeus", "Ursus Arctos"]),
        Trivia(q: "What are rhino's horn made of?", correct: "Keratin", incorrect: ["Bone", "Ivory", "Skin"]),
        Trivia(q: "How many legs do butterflies have?", correct: "6", incorrect: ["2", "4", "0"]),
        Trivia(q: "What scientific suborder does the family Hyaenidae belong to?", correct: "Feliformia", incorrect: ["Haplorhini", "Caniformia", "Ciconiiformes"]),
        Trivia(q: "How many known living species of hyenas are there?", correct: "4", incorrect: ["8", "2", "6"]),
        Trivia(q: "What scientific family does the Aardwolf belong to?", correct: "Hyaenidae", incorrect: ["Canidae", "Felidae", "Eupleridae"]),
        Trivia(q: "What do you call a baby bat?", correct: "Pup", incorrect: ["Cub", "Chick", "Kid"]),
        Trivia(q: "What is the scientific name of the cheetah?", correct: "Acinonyx jubatus", incorrect: ["Panthera onca", "Lynx rufus", "Felis catus"]),
        Trivia(q: "What is the scientific name of the Budgerigar?", correct: "Melopsittacus undulatus", incorrect: ["Nymphicus hollandicus", "Pyrrhura molinae", "Ara macao"]),
        Trivia(q: "Which animal was part of an Russian domestication experiment in 1959?", correct: "Foxes", incorrect: ["Pigeons", "Bears", "Alligators"]),
        Trivia(q: "The now extinct species \"Thylacine\" was native to where?", correct: "Tasmania, Australia", incorrect: ["Baluchistan, Pakistan", "Wallachia, Romania", "Oregon, United States"]),
        Trivia(q: "What is the Gray Wolf's scientific name?", correct: "Canis Lupus", incorrect: ["Canis Aureus", "Canis Latrans", "Canis Lupus Lycaon"]),
        Trivia(q: "What is Grumpy Cat's real name?", correct: "Tardar Sauce", incorrect: ["Sauce", "Minnie", "Broccoli"]),
        Trivia(q: "What type of creature is a Bonobo?", correct: "Ape", incorrect: ["Lion", "Parrot", "Wildcat"]),
        Trivia(q: "Which of these species is not extinct?", correct: "Komodo dragon", incorrect: ["Japanese sea lion", "Tasmanian tiger", "Saudi gazelle"]),
        Trivia(q: "Which class of animals are newts members of?", correct: "Amphibian", incorrect: ["Fish", "Reptiles", "Mammals"]),
        Trivia(q: "Unlike on most salamanders, this part of a newt is flat?", correct: "Tail", incorrect: ["Head", "Teeth", "Feet"]),
        Trivia(q: "What is the name of the family that the domestic cat is a member of?", correct: "Felidae", incorrect: ["Felinae", "Felis", "Cat"]),
        Trivia(q: "What dog bread is one of the oldest breeds of dog and has flourished since before 400 BCE.", correct: "Pugs", incorrect: ["Bulldogs", "Boxers", "Chihuahua"]),
        Trivia(q: "What is the name of the copper-rich protein that creates the blue blood in the Antarctic octopus?", correct: "Hemocyanin", incorrect: ["Cytochrome", "Iron", "Methionine"]),
        Trivia(q: "Which species is a \"mountain chicken\"?", correct: "Frog", incorrect: ["Chicken", "Horse", "Fly"]),
        Trivia(q: "The dish Fugu, is made from what family of fish?", correct: "Pufferfish", incorrect: ["Bass", "Salmon", "Mackerel"]),
        Trivia(q: "What is the collective noun for a group of crows?", correct: "Murder", incorrect: ["Pack", "Gaggle", "Herd"]),
        Trivia(q: "Which of the following is another name for the \"Poecilotheria Metallica Tarantula\"?", correct: "Gooty", incorrect: ["Hopper", "Silver Stripe", "Woebegone"]),
        Trivia(q: "What is the scientific name of the Common Chimpanzee?", correct: "Pan troglodytes", incorrect: ["Gorilla gorilla", "Pan paniscus", "Panthera leo"]),
        Trivia(q: "By definition, where does an abyssopelagic animal live?", correct: "At the bottom of the ocean", incorrect: ["In the desert", "On top of a mountain", "Inside a tree"]),
        Trivia(q: "Which of these is a colony of polyps and not a jellyfish?", correct: "Portuguese Man-of-War", incorrect: ["Sea Wasp", "Irukandji", "Sea Nettle"]),
        Trivia(q: "What colour is the female blackbird?", correct: "Brown", incorrect: ["Black", "White", "Yellow"]),
        Trivia(q: "What is the common term for bovine spongiform encephalopathy (BSE)?", correct: "Mad Cow disease", incorrect: ["Weil\'s disease", "Milk fever", "Foot-and-mouth disease"]),
        Trivia(q: "How many teeth does an adult rabbit have?", correct: "28", incorrect: ["30", "26", "24"]),
        Trivia(q: "What is the name for a male bee that comes from an unfertilized egg?", correct: "Drone", incorrect: ["Soldier", "Worker", "Male"]),
        Trivia(q: "What is the name of a rabbit's abode?", correct: "Burrow", incorrect: ["Nest", "Den", "Dray"]),
        Trivia(q: "What is the collective noun for bears?", correct: "Sloth", incorrect: ["Drove", "Tribe", "Husk"]),
        Trivia(q: "What is the collective noun for rats?", correct: "Mischief", incorrect: ["Pack", "Race", "Drift"]),
        Trivia(q: "What is the collective noun for vultures?", correct: "Wake", incorrect: ["Ambush", "Building", "Gaze"]),
        Trivia(q: "What bird is born with claws on its wing digits?", correct: "Hoatzin", incorrect: ["Cormorant", "Cassowary", "Secretary bird"]),
        Trivia(q: "\"Decapods\" are an order of ten-footed crustaceans. Which of these are NOT decapods?", correct: "Krill", incorrect: ["Lobsters", "Shrimp", "Crabs"]),
        Trivia(q: "To which biological phylum do all mammals, birds and reptiles belong?", correct: "Chordata", incorrect: ["Echinodermata", "Annelida", "Placazoa"]),
        Trivia(q: "What is the world's longest venomous snake?", correct: "King Cobra", incorrect: ["Green Anaconda", "Inland Taipan", "Yellow Bellied Sea Snake"]),
        ],

        
        //vehicles
        "Vehicles" :
        [
        Trivia(q: "Where are the cars of the brand \"Ferrari\" manufactured?", correct: "Italy", incorrect: ["Romania", "Germany", "Russia"]),
        Trivia(q: "What was the name of the first front-wheel-drive car produced by Datsun (now Nissan)?", correct: "Cherry", incorrect: ["Sunny", "Bluebird", "Skyline"]),
        Trivia(q: "Which animal features on the logo for Abarth, the motorsport division of Fiat?", correct: "Scorpion", incorrect: ["Snake", "Bull", "Horse"]),
        Trivia(q: "Which Italian city is home of the car manufacturer 'Fiat'?", correct: "Turin", incorrect: ["Maranello", "Modena", "Rome"]),
        Trivia(q: "Which country has the international vehicle registration letter 'A'?", correct: "Austria", incorrect: ["Afghanistan", "Australia", "Armenia"]),
        Trivia(q: "Which Japanese company is the world's largest manufacturer of motorcycles?", correct: "Honda", incorrect: ["Yamaha", "Suzuki", "Kawasaki"]),
        Trivia(q: "What country is the Hussarya supercar, made by the car manufacturer \"Arrinera\", assembled in?", correct: "Poland", incorrect: ["China", "Sweden", "Italy"]),
        Trivia(q: "Which of the following is NOT a Russian car manufacturer?", correct: "BYD", incorrect: ["Silant", "Dragon", "GAZ"]),
        Trivia(q: "Which of the following car manufacturers had a war named after it?", correct: "Toyota", incorrect: ["Honda", "Ford", "Volkswagen"]),
        Trivia(q: "Which of the following countries has officially banned the civilian use of dash cams in cars?", correct: "Austria", incorrect: ["United States", "Czechia", "South Korea"]),
        Trivia(q: "Which of the following passenger jets is the longest?", correct: "Boeing 747-8", incorrect: ["Airbus A350-1000", "Airbus A330-200", "Boeing 787-10"]),
        Trivia(q: "The difference between the lengths of a Boeing 777-300ER and an Airbus A350-1000 is closest to:", correct: "0.1m", incorrect: ["1m", "10m ", "100m"]),
        Trivia(q: "Enzo Ferrari was originally an auto racer for what manufacturer before founding his own car company?", correct: "Alfa Romeo", incorrect: ["Auto Union", "Mercedes Benz", "Bentley"]),
        Trivia(q: "Complete the following analogy: Audi is to Volkswagen as Infiniti is to ?", correct: "Nissan", incorrect: ["Honda", "Hyundai", "Subaru"]),
        Trivia(q: "Which of the following vehicles featured a full glass roof at base model?", correct: "Renault Avantime", incorrect: ["Chevy Volt", "Mercedes-Benz A-Class", "Honda Odyssey"]),
        Trivia(q: "When was Tesla founded?", correct: "2003", incorrect: ["2008", "2005", "2007"]),
        Trivia(q: "What UK Train does NOT go over 125MPH?", correct: "Sprinter", incorrect: ["Class 43", "Javelin", "Pendolino"]),
        Trivia(q: "Which of the following collision avoidance systems helps airplanes avoid colliding with each other?", correct: "TCAS", incorrect: ["GPWS", "OCAS", "TAWS"]),
        Trivia(q: "Which of these is NOT a car model produced by Malaysian car manufacturer Proton?", correct: "Kelisa", incorrect: ["Saga", "Perdana", "Inspira"]),
        Trivia(q: "Which of these companies does NOT manufacture motorcycles?", correct: "Toyota", incorrect: ["Honda", "Kawasaki", "Yamaha"]),
        Trivia(q: "Which one of these chassis codes are used by BMW 3-series?", correct: "E46", incorrect: ["E39", "E85", "F10"]),
        Trivia(q: "Which supercar company is from Sweden?", correct: "Koenigsegg", incorrect: ["Bugatti", "Lamborghini", "McLaren"]),
        Trivia(q: "Which car brand does NOT belong to General Motors?", correct: "Ford", incorrect: ["Buick", "Cadillac", "Chevrolet"]),
        Trivia(q: "Automobiles produced by Telsa Motors operate on which form of energy?", correct: "Electricity", incorrect: ["Gasoline", "Diesel", "Nuclear"]),
        Trivia(q: "Which car is the first mass-produced hybrid vehicle?", correct: "Toyota Prius", incorrect: ["Chevrolet Volt", "Honda Fit", "Peugeot 308 R HYbrid"]),
        Trivia(q: "Which of these car models are produced by Lamborghini?", correct: "Aventador", incorrect: ["Huayra", "918", "Chiron"]),
        Trivia(q: "Which Variable Valve Timing technology is used by BMW?", correct: "VANOS", incorrect: ["VVT-iw", "VVEL", "MultiAir"]),
        Trivia(q: "What do the 4 Rings in Audi's Logo represent?", correct: "Previously independent automobile manufacturers", incorrect: ["States in which Audi makes the most sales", "Main cities vital to Audi", "Countries in which Audi makes the most sales"]),
        Trivia(q: "Which one is NOT the function of engine oil in car engines?", correct: "Combustion", incorrect: ["Lubrication", "Cooling", "Reduce corrosion"]),
        Trivia(q: "How much horsepower is produced by the SD40-2 Locomotive?", correct: "3,000", incorrect: ["3,200", "2,578", "2,190"]),
        Trivia(q: "What engine is in the Lexus SC400?", correct: "1UZ-FE", incorrect: ["2JZ-GTE", "7M-GTE", "5M-GE"]),
        Trivia(q: "Volkswagen's legendary VR6 engine has cylinders positioned at what degree angle?", correct: "15 Degree", incorrect: ["30 Degree", "45 Degree", "90 Degree"]),
        Trivia(q: "Which one of the following is NOT a sub-company of the Volkswagen Group?", correct: "Opel", incorrect: ["Porsche", "Bugatti", "Bentley"]),
        Trivia(q: "In 2014, over 6 million General Motors vehicles were recalled due to what critical flaw?", correct: "Faulty ignition switch", incorrect: ["Malfunctioning gas pedal", "Breaking fuel lines", "Faulty brake pads"]),
        Trivia(q: "Which car tire manufacturer is famous for its \"Eagle\" brand of tires, and is the official tire supplier of NASCAR?", correct: "Goodyear", incorrect: ["Pirelli", "Bridgestone", "Michelin"]),
        Trivia(q: "Which car tire manufacturer is famous for its \"P Zero\" line?", correct: "Pirelli", incorrect: ["Goodyear", "Bridgestone", "Michelin"]),
        Trivia(q: "When was Cadillac founded?", correct: "1902", incorrect: ["1964", "1898", "1985"]),
        Trivia(q: "What are the cylinder-like parts that pump up and down within the engine?", correct: "Pistons", incorrect: ["Leaf Springs", "Radiators", "ABS"]),
        Trivia(q: "Which one of the following is not made by Ford?", correct: "Camry", incorrect: ["Fusion", "Model A", "F-150"]),
        Trivia(q: "The LS1 engine is how many cubic inches?", correct: "346", incorrect: ["350", "355", "360"]),
        Trivia(q: "The LS7 engine is how many cubic inches?", correct: "427", incorrect: ["346", "364", "376"]),
        Trivia(q: "The LS3 engine is how many cubic inches?", correct: "376", incorrect: ["346", "364", "427"]),
        Trivia(q: "What is the name of Nissan's most popular electric car?", correct: "Leaf", incorrect: ["Tree", "Deer", "Roots"]),
        Trivia(q: "Which car manufacturer created the \"Aventador\"?", correct: "Lamborghini", incorrect: ["Ferrari", "Pagani", "Bugatti"]),
        Trivia(q: "Which Audi does not use Haldex based all wheel drive system?", correct: "Audi A8", incorrect: ["Audi TT", "Audi S3", "Audi A3"]),
        Trivia(q: "What kind of train was Stepney, a train on the Bluebell Railway notable for his appearance in \"The Railway Series\"?", correct: "LB&SCR A1X", incorrect: ["LB&SCR E2", "LB&SCR J1", "LB&SCR D1"]),
        Trivia(q: "What car manufacturer gave away their patent for the seat-belt in the interest of saving lives?", correct: "Volvo", incorrect: ["Ferrari", "Ford", "Renault"]),
        Trivia(q: "What country was the Trabant 601 manufactured in?", correct: "East Germany", incorrect: ["Soviet Union", "Hungary", "France"]),
        Trivia(q: "Which of these cars is NOT considered one of the 5 Modern Supercars by Ferrari?", correct: "Testarossa", incorrect: ["Enzo Ferrari", "F40", "288 GTO"]),
        Trivia(q: "What is the fastest road legal car in the world?", correct: "Koenigsegg Agera RS", incorrect: ["Hennessy Venom GT", "Bugatti Veyron Super Sport", "Pagani Huayra BC"]),
        ],

        //enerteainment: comics
        "Entertainment: Comics" :
        [
        Trivia(q: "Who is Batman?", correct: "Bruce Wayne", incorrect: ["Clark Kent", "Barry Allen", "Tony Stark"]),
        Trivia(q: "In Marvel Comics, Taurus is the founder and leader of which criminal organization?", correct: "Zodiac", incorrect: ["Scorpio", "Tiger Mafia", "The Union"]),
        Trivia(q: "What's the name of Batman's parents?", correct: "Thomas & Martha", incorrect: ["Joey & Jackie", "Jason & Sarah", "Todd & Mira"]),
        Trivia(q: "In the Batman comics, by what other name is the villain Dr. Jonathan Crane known?", correct: "Scarecrow", incorrect: ["Bane", "Calendar Man", "Clayface"]),
        Trivia(q: "Who is the creator of the comic series \"The Walking Dead\"?", correct: "Robert Kirkman", incorrect: ["Stan Lee", "Malcolm Wheeler-Nicholson", "Robert Crumb"]),
        Trivia(q: "What was the name of the first Robin in the Batman comics?", correct: "Dick Grayson", incorrect: ["Bruce Wayne", "Jason Todd", "Tim Drake"]),
        Trivia(q: "What is the name of the comic about a young boy, and a tiger who is actually a stuffed animal?", correct: "Calvin and Hobbes", incorrect: ["Winnie the Pooh", "Albert and Pogo", "Peanuts"]),
        Trivia(q: "In what Homestuck Update was [S] Game Over released?", correct: "October 25th, 2014", incorrect: ["April 13th, 2009", "April 8th, 2012", "August 28th, 2003"]),
        Trivia(q: "In the Homestuck Series, what is the alternate name for the Kingdom of Lights?", correct: "Prospit", incorrect: ["No Name", "Golden City", "Yellow Moon"]),
        Trivia(q: "Which of the following superheros did Wonder Woman NOT have a love interest in?", correct: "Green Arrow", incorrect: ["Superman", "Batman", "Steve Trevor"]),
        Trivia(q: "This Marvel superhero is often called \"The man without fear\".", correct: "Daredevil", incorrect: ["Thor", "Wolverine", "Hulk"]),
        Trivia(q: "Which issue of the \"Sonic the Hedgehog\" comic did Scourge the Hedgehog make his first appearance?", correct: "Sonic the Hedgehog #11", incorrect: ["Sonic Universe #32", "Sonic the Hedgehog #161", "Sonic the Hedgehog #47"]),
        Trivia(q: "In \"Sonic the Hedgehog\" comic, who was the creator of Roboticizer? ", correct: "Professor Charles the Hedgehog", incorrect: ["Julian Robotnik", "Ivo Robotnik", "Snively Robotnik"]),
        Trivia(q: "What year was the first San Diego Comic-Con?", correct: "1970", incorrect: ["2000", "1990", "1985"]),
        Trivia(q: "When was the Garfield comic first published?", correct: "1978", incorrect: ["1982", "1973", "1988"]),
        Trivia(q: "What is the designation given to the Marvel Cinematic Universe?", correct: "Earth-199999", incorrect: ["Earth-616", "Earth-10005", "Earth-2008"]),
        Trivia(q: "Who created Ultron of Earth-616?", correct: "Henry Pym", incorrect: ["Amadeus Cho", "Tony Stark", "Reed Richards"]),
        Trivia(q: "What is the real hair colour of the mainstream comic book version (Earth-616) of Daredevil?", correct: "Blonde", incorrect: ["Auburn", "Brown", "Black"]),
        Trivia(q: "In what year did the first \"The Walking Dead\" comic come out?", correct: "2003", incorrect: ["2001", "2006", "1999"]),
        Trivia(q: "In the comics, which Sonic character took command of the Dark Legion after Luger's assassination?", correct: "Lien-Da", incorrect: ["Kragok", "Dimitri", "Remington"]),
        Trivia(q: "What is the alter-ego of the DC comics character \"Superman\"?", correct: "Clark Kent", incorrect: ["Bruce Wayne", "Arthur Curry", "John Jones"]),
        Trivia(q: "In the webcomic \"Ava's Demon\", what sin is \"Nevy Nervine\" based off of? ", correct: "Envy ", incorrect: ["Sloth", "Wrath ", "Lust"]),
        Trivia(q: "Which \"Green Arrow\" sidekick commonly wears a baseball cap?", correct: "Roy Harper", incorrect: ["Black Canary", "Emiko Queen", "Dick Grayson"]),
        Trivia(q: "Which Batman sidekick is the son of Talia al Ghul?", correct: "Damian Wayne", incorrect: ["Dick Grayson", "Tim Drake", "Jason Todd"]),
        Trivia(q: "In the DC Comics 2016 reboot, Rebirth, which speedster escaped from the Speed Force after he had been erased from existance?", correct: "Wally West", incorrect: ["Johnny Quick", "Jay Garrick", "Eobard Thawne"]),
        Trivia(q: "What is the full first name of the babysitter in Calvin and Hobbes?", correct: "Rosalyn", incorrect: ["Rose", "Ruby", "Rachel"]),
        Trivia(q: "In Calvin and Hobbes, what is the name of the babysitter's boyfriend?", correct: "Charlie", incorrect: ["Dave", "Charles", "Nathaniel"]),
        Trivia(q: "The main six year old protagonist in Calvin and Hobbes is named after what theologian?", correct: "John Calvin", incorrect: ["Calvin Klein", "Calvin Coolidge", "Phillip Calvin McGraw"]),
        Trivia(q: "The stuffed tiger in Calvin and Hobbes is named after what philosopher?", correct: "Thomas Hobbes", incorrect: ["David Hobbes", "John Hobbes", "Nathaniel Hobbes"]),
        Trivia(q: "In Calvin and Hobbes, what is the name of Susie's stuffed rabbit?", correct: "Mr. Bun", incorrect: ["Mr. Bunbun", "Mr. Rabbit", "Mr. Hoppy"]),
        Trivia(q: "When Batman trolls the online chat rooms, what alias does he use?", correct: "JonDoe297", incorrect: ["iAmBatman", "BWayne13", "BW1129"]),
        Trivia(q: "In 1978, Superman teamed up with what celebrity, to defeat an alien invasion?", correct: "Muhammad Ali", incorrect: ["Mike Tyson", "Sylvester Stallone", "Arnold Schwarzenegger"]),
        Trivia(q: "Who was the inspiration for Cuthbert Calculus in the Tintin series?", correct: "Auguste Picard", incorrect: ["Jacques Piccard", "Will Morris", "J. Cecil Maby"]),
        Trivia(q: "In \"Homestuck\" what is Dave Strider's guardian?", correct: "Bro", incorrect: ["Becquerel", "Doc Scratch", "Halley"]),
        Trivia(q: "In Bionicle, who was formerly a Av-Matoran and is now the Toa of Light?", correct: "Takua", incorrect: ["Jaller", "Vakama", "Tahu"]),
        Trivia(q: "Found in the Marvel Comics fictional universe, what is the name of the nearly indestructible metal that coats Wolverine's bones and claws?", correct: "Adamantium", incorrect: ["Titanium", "Vibranium", "Carbonadium"]),
        Trivia(q: "Who is the second person to take up the mantle of Night Owl in the Watchmen graphic novel?", correct: "Daniel Dreiberg", incorrect: ["Nelson Gardner", "Hollis Mason", "Adrian Veidt"]),
        Trivia(q: "When was Marvel Comics founded?", correct: "1939", incorrect: ["1932", "1951", "1936"]),
        Trivia(q: "What is Homestuck character Gamzee's last name?", correct: "Makara", incorrect: ["Makera", "Makare", "Makrea"]),
        Trivia(q: "Better known by his nickname Logan, what is Wolverine's birth name?", correct: "James Howlett", incorrect: ["Logan Wolf", "Thomas Wilde", "John Savage"]),
        Trivia(q: "What are the Three Virtues of Bionicle?", correct: "Unity, Duty, Destiny", incorrect: ["Build, Play, Change", "Work, Play, Live", "Forge, Build, Fight"]),
        Trivia(q: "In the Hellboy universe, who founded the BPRD?", correct: "Trevor Bruttenholm", incorrect: ["Kate Corrigan", "Johann Kraus", "Benjamin Daimio"]),
        Trivia(q: "What is Hellboy's true name?", correct: "Anung Un Rama", incorrect: ["Right Hand of Doom", "Ogdru Jahad", "Azzael"]),
        Trivia(q: "In the Hellboy universe, what was Abe Sapien's birth name?", correct: "Langdon Everett Caul", incorrect: ["Lord Baltimore", "Sir Edward Grey", "Landis Pope"]),
        Trivia(q: "Which pulp hero made appearances in Hellboy and BPRD comics before getting his own spin-off?", correct: "Lobster Johnson", incorrect: ["Roger the Homunculus", "The Spider", "The Wendigo"]),
        Trivia(q: "In Black Hammer, what city did the heroes save from the Anti-God?", correct: "Spiral City", incorrect: ["Mega-City One", "Rockwood", "Star City"]),
        Trivia(q: "In Black Hammer, what dimension does Colonel Weird travel through?", correct: "Para-Zone", incorrect: ["Hyperspace", "Mirror Universe", "Phantom Zone"]),
        Trivia(q: "What's the race of Invincible's father?", correct: "Viltrumite", incorrect: ["Kryptonian", "Kree", "Irken"]),
        Trivia(q: "Which one of these superhero teams appears in the Invincible comics?", correct: "Guardians of the Globe", incorrect: ["Avengers", "Justice League", "Teenage Mutant Ninja Turtles"]),
        Trivia(q: "Who was the first American Vampire (Scott Snyder's American Vampire)?", correct: "Skinner Sweet", incorrect: ["Hattie Hargrove", "Pearl Jones", "James \\\"Jim\\\" Book"]),
        ],

        //entertainent - japanese anime/manga
        "Entertainment: Japanese Anime & Manga" :
        [
        Trivia(q: "Who wrote and directed the animated movie \"Spirited Away\" (2001)?", correct: "Hayao Miyazaki", incorrect: ["Isao Takahata", "Mamoru Hosoda", "Hidetaka Miyazaki"]),
        Trivia(q: "In Dragon Ball Z, who was the first character to go Super Saiyan 2?", correct: "Gohan", incorrect: ["Goku", "Vegeta", "Trunks"]),
        Trivia(q: "What is the name of the corgi in Cowboy Bebop?", correct: "Einstein", incorrect: ["Edward", "Rocket", "Joel"]),
        Trivia(q: "In \"Fairy Tail\", what is the nickname of Natsu Dragneel?", correct: "The Salamander", incorrect: ["The Dragon Slayer", "The Dragon", "The Demon"]),
        Trivia(q: "In \"Shakugan no Shana\" what was the Shana usually referred as?", correct: "Flame-Haired Burning-Eyed Hunter", incorrect: ["Flame Haze", "Flame-Haired Burning-Eyed Haze", "Shana"]),
        Trivia(q: "In the anime, Full Metal Panic!, who is Kaname's best friend?", correct: "Kyoko Tokiwa", incorrect: ["Melissa Mao", "Ren Mikihara", "Teletha \\\"Tessa\\\" Testarossa"]),
        Trivia(q: "In \"Highschool of the Dead\", where did Komuro and Saeko establish to meet after the bus explosion?", correct: "Eastern Police Station", incorrect: ["The Center Mall", "Komuro\'s House", "On The Main Bridge"]),
        Trivia(q: "Which band name isn't a Stand in \"JoJo's Bizzare Adventure\"?", correct: "AC/DC", incorrect: ["Green Day", "Survivor", "Red Hot Chili Peppers"]),
        Trivia(q: "What was Ash Ketchum's second Pokemon?", correct: "Caterpie", incorrect: ["Charmander", "Pikachu", "Pidgey"]),
        Trivia(q: "The main protagonist of the fourth part of JoJo's Bizarre Adventure is which of the following?", correct: "Josuke Higashikata", incorrect: ["Yoshikage kira", "Koichi Hirose", "Joey JoJo"]),
        Trivia(q: "The main protagonist of the fifth part of JoJo's Bizarre Adventure is which of the following?", correct: "Giorno Giovanna", incorrect: ["Guido Mista", "Jonathan Joestar", "Joey JoJo"]),
        Trivia(q: "In JoJo's Bizarre Adventure, winch character is able to accelerate time?", correct: "Enrico Pucci", incorrect: ["Jotaro Kujo", "Jolyne Cujoh", "Kujo Jotaro"]),
        Trivia(q: "Winch of these names are not a character of JoJo's Bizarre Adventure?", correct: "JoJo Kikasu", incorrect: ["Jean-Pierre Polnareff", "George Joestar", "Risotto Nero"]),
        Trivia(q: "Who is the main character with yellow hair in the anime Naruto?", correct: "Naruto", incorrect: ["Ten Ten", "Sasuke", "Kakashi"]),
        Trivia(q: "In \"Future Diary\", what is the name of Yuno Gasai's Phone Diary?", correct: "Yukiteru Diary", incorrect: ["Murder Diary", "Escape Diary ", "Justice Diary "]),
        Trivia(q: "What song plays in the ending credits of the anime \"Ergo Proxy\"?", correct: "Paranoid Android", incorrect: ["Sadistic Summer", "Bittersweet Symphony", "Mad World"]),
        Trivia(q: "In the anime Black Butler, who is betrothed to be married to Ciel Phantomhive?", correct: "Elizabeth Midford", incorrect: ["Rachel Phantomhive", "Alexis Leon Midford", "Angelina Dalles"]),
        Trivia(q: "In \"The Melancholy of Haruhi Suzumiya\" series, the SOS Brigade club leader is unknowingly treated as a(n) __ by her peers.", correct: "God", incorrect: ["Alien", "Time Traveler", "Esper"]),
        Trivia(q: "In \"A Certain Scientific Railgun\", how many \"sisters\" did Accelerator have to kill to achieve the rumored level 6?", correct: "20,000", incorrect: ["128", "10,000", "5,000"]),
        Trivia(q: "What sport is being played in the Anime Eyeshield 21?", correct: "American Football", incorrect: ["Baseball", "Football", "Basketball"]),
        Trivia(q: "In the 2012 animated film \"Wolf Children\", what are the names of the wolf children?", correct: "Ame & Yuki", incorrect: ["Hana & Yuki", "Ame & Hana", "Chuck & Anna"]),
        Trivia(q: "What year did \"Attack on Titan\" Season 2 begin airing?", correct: "2017", incorrect: ["2018", "2019", "2020"]),
        Trivia(q: "The two main characters of \"No Game No Life\", Sora and Shiro, together go by what name?", correct: "Blank", incorrect: ["Immanity", "Disboard", "Warbeasts"]),
        Trivia(q: "Medaka Kurokami from \"Medaka Box\" has what abnormality?", correct: "The End", incorrect: ["Perfection", "Sandbox", "Fairness"]),
        Trivia(q: "Krusty is the guild master of which guild in \"Log Horizon\"?", correct: "D. D. D", incorrect: ["Silver Sword", "West Wind Brigade", "Oceanic Systems (Marine Agency)"]),
        Trivia(q: "In \"One Piece\", which one of the following is NOT an Ancient Weapon?", correct: "Jupiter", incorrect: ["Uranus", "Poseidon", "Pluton"]),
        Trivia(q: "In what year did the manga \"Ping Pong\" begin serialization?", correct: "1996", incorrect: ["2014", "2010", "2003"]),
        Trivia(q: "In \"JoJo's Bizarre Adventure\", which of the following Stands does NOT have a time-based ability?", correct: "20th Century Boy", incorrect: ["Made in Heaven", "Star Platinum", "The World"]),
        Trivia(q: "What year did \"Attack on Titan\" first air?", correct: "2013", incorrect: ["2014", "2012", "2015"]),
        Trivia(q: "\"Silhouette\", a song performed by the group 'KANA-BOON' is featured as the sixteenth opening of which anime?", correct: "Naruto: Shippūden", incorrect: ["One Piece", "Naruto", "Gurren Lagann"]),
        Trivia(q: "Who is the colossal titan in \"Attack On Titan\"?", correct: "Bertolt Hoover", incorrect: ["Reiner", "Eren", "Sasha"]),
        Trivia(q: "In the \"Re:Zero\" manga series, which of the following Sin Archbishops eats Rem's existence?", correct: "Ley Batenkaitos", incorrect: ["Roy Alphard", "Petelgeuse Romanee-Conti", "Louis Arneb"]),
        Trivia(q: "In \"Black Lagoon\", what colour is Rock's tie?", correct: "Teal", incorrect: ["Crimson", "Dark Brown", "Black"]),
        Trivia(q: "What animation studio produced \"Gurren Lagann\"?", correct: "Gainax", incorrect: ["Kyoto Animation", "Pierrot", "A-1 Pictures"]),
        Trivia(q: "In which manga did the \"404 Girl\" from 4chan originate from?", correct: "Yotsuba&!", incorrect: ["Azumanga Daioh", "Lucky Star", "Clover"]),
        Trivia(q: "What studio animated Ouran High School Host Club?", correct: "Bones", incorrect: ["Production I.G", "Kyoto Animation", "xebec"]),
        Trivia(q: "In the Overlord Anime who was Cocytus made by?", correct: "Warrior Takemikazuchi", incorrect: ["Peroroncino", "Ulbert Alain Odle", "Bukubukuchagama"]),
        Trivia(q: "Which of these is not a world in the anime \"Buddyfight\"?", correct: "Ancient Dragon World", incorrect: ["Dragon World", "Star Dragon World", "Darkness Dragon World"]),
        Trivia(q: "How does the character Dragowizard, Qinus Axia's from the anime \"Buddyfight\" differ between the Japanese and English dubs?", correct: "Different Gender", incorrect: ["Different Body Proportions", "Different Backstory", "Different Appearance"]),
        Trivia(q: "Who is the main character in One Piece?", correct: "Luffy", incorrect: ["Shanks", "Zoro", "Smoker"]),
        Trivia(q: "Which part from the JoJo's Bizarre Adventure manga is about a horse race across America?", correct: "Part 7: Steel Ball Run", incorrect: ["Part 6: Stone Ocean", "Part 3: Stardust Crusaders", "Part 5: Golden Wind"]),
        Trivia(q: "Who was the Author of the manga Monster Hunter Orage?", correct: "Hiro Mashima", incorrect: ["Shin Yamamoto", "Keiichi Hikami", "Hirohiko Araki"]),
        Trivia(q: "What is the name of the protagonist of the 2017 anime \"Land of the Lustrous\"?", correct: "Phosphophyllite", incorrect: ["Watermelon Tourmaline", "Cinnabar", "Padparadscha"]),
        Trivia(q: "Which of the following films was NOT directed by Hayao Miyazaki?", correct: "Wolf Children", incorrect: ["Princess Mononoke", "Spirited Away", "Kiki\'s Delivery Service"]),
        Trivia(q: "What is the name of JoJo's Bizarre Adventure Part 5?", correct: "Vento Aureo", incorrect: ["Vento Oreo", "Vanto Aureo", "Vento Eureo"]),
        Trivia(q: "Who is the horror manga artist who made Uzumaki?", correct: "Junji Ito", incorrect: ["Kazuo Umezu", "Shintaro Kago", "Sui Ishida"]),
        Trivia(q: "In the series JoJo's Bizarre Adventure, which main character makes the greatest number of recurring appearances?", correct: "Jotaro Kujo", incorrect: ["Giorno Giovanna", "Joseph Joestar", "Josuke Higashikata"]),
        Trivia(q: "Which JoJo's Bizarre Adventure character possesses the Stand named Silver Chariot?", correct: "Jean Pierre Polnareff", incorrect: ["Noriaki Kakyoin", "Hol Horse", "Hermes Costello"]),
        Trivia(q: "In JoJo's Bizarre Adventure, who says \"Yare yare daze\"?", correct: "Jotaro Kujo", incorrect: ["Joseph Joestar", "Jolyne Cujoh", "Koichi Hirose"]),
        Trivia(q: "In the anime \"My Hero Academia\", which character is shown with the ability to manipulate gravity?", correct: "Uraraka", incorrect: ["Bakugo", "Deku", "Asui "]),
        ],

        //ent - cartoon
        "Entertainment: Cartoon & Animations" :
        [
        Trivia(q: "Who was the villain of ''The Lion King''?", correct: "Scar", incorrect: ["Fred", "Jafar", "Vada"]),
        Trivia(q: "Which of the following did not feature in the cartoon 'Wacky Races'?", correct: "The Dragon Wagon", incorrect: ["The Bouldermobile", "The Crimson Haybailer", "The Compact Pussycat"]),
        Trivia(q: "What is Scooby-Doo's real name?", correct: "Scoobert", incorrect: ["Scooter", "Scrappy", "Shooby"]),
        Trivia(q: "In South Park, what is Stan's surname?", correct: "Marsh", incorrect: ["Stotch", "Broflovski", "Tweak"]),
        Trivia(q: "In the TV show \"Rick and Morty\", Rick uses the catchphrase \"Wubba Lubba Dub Dub\", which means what in Birdperson?", correct: "I am in great pain, please help me.", incorrect: ["I pray that my life ends soon.", "Lets get this party started!", "I am suffering, please help me."]),
        Trivia(q: "What was the name of the sea witch in the 1989 Disney film \"The Little Mermaid\"?", correct: "Ursula", incorrect: ["Madam Mim", "Maleficent", "Lady Tremaine"]),
        Trivia(q: "What town was \"Springfield\" from \"The Simpsons\" originally named after?", correct: "Springfield, Oregon", incorrect: ["Springfield, Missouri", "Springfield, Illinois", "Springfield, Massachusetts"]),
        Trivia(q: "Which \"Toy Story\" character was voiced by Don Rickles?", correct: "Mr. Potato Head", incorrect: ["Slinky Dog", "Hamm", "Rex"]),
        Trivia(q: "Butters Stotch, Pip Pirrup, and Wendy Testaburger are all characters in which long running animated TV series?", correct: "South Park", incorrect: ["The Simpsons", "Family Guy", "Bob\'s Burgers"]),
        Trivia(q: "Which of these is NOT a Disney cartoon character?", correct: "Daffy Duck", incorrect: ["Donald Duck", "Daisy Duck", "Scrooge McDuck"]),
        Trivia(q: "What is the relationship between Rick and Morty in the show \"Rick and Morty\"?", correct: "Grandfather and Grandson", incorrect: ["Father and Son", "Best Friends", "Crimefighting Partners"]),
        Trivia(q: "What year was the Disney film \"A Goofy Movie\" released?", correct: "1995", incorrect: ["1999", "2001", "1997"]),
        Trivia(q: "Who voices for Ruby in the animated series RWBY?", correct: "Lindsay Jones", incorrect: ["Tara Strong", "Jessica Nigri", "Hayden Panettiere"]),
        Trivia(q: "What is the standard frame rate for animation?", correct: "24 FPS", incorrect: ["12 FPS", "30 FPS", "60 FPS"]),
        Trivia(q: "What is the name of Sid's dog in \"Toy Story\"?", correct: "Scud", incorrect: ["Buster", "Whiskers", "Mr. Jones"]),
        Trivia(q: "What was the first Disney movie to use CGI?", correct: "The Black Cauldron", incorrect: ["Tron", "Toy Story", "Fantasia"]),
        Trivia(q: "In the Pixar film, \"Toy Story\" what was the name of the child who owned the toys?", correct: "Andy", incorrect: ["Edward", "Danny", "Matt"]),
        Trivia(q: "Which of the following films was Don Bluth both the writer, director, and producer for?", correct: "All Dogs Go To Heaven", incorrect: ["Titan A.E.", "Anastasia", "The Land Before Time"]),
        Trivia(q: "What Cartoon Network show aired its first episode on November 4th, 2013?", correct: "Steven Universe", incorrect: ["Regular Show", "Adventure Time", "The Amazing World of Gumball"]),
        Trivia(q: "In the 1993 Disney animated series \"Bonkers\", what is the name of Bonker's second partner?", correct: "Miranda Wright", incorrect: ["Dick Tracy", "Eddie Valiant", "Dr. Ludwig von Drake"]),
        Trivia(q: "Which episode from The Amazing World Of Gumball won the Childrens Choice Award at the British Animation Awards in 2016?", correct: "The Shell", incorrect: ["The Limit", "The Kids", "The Gripes"]),
        Trivia(q: "What is the cartoon character, Andy Capp, known as in Germany?", correct: "Willi Wakker", incorrect: ["Dick Tingeler", "Helmut Schmacker", "Rod Tapper"]),
        Trivia(q: "In the animated series RWBY, what is the name of the weapon used by Weiss Schnee?", correct: "Myrtenaster", incorrect: ["Gambol Shroud", "Crescent Rose", "Ember Celica"]),
        Trivia(q: "Which of the following is not a Flintstones character?", correct: "Lord Rockingham IX", incorrect: ["Rockhead Slate", "The Great Gazoo", "Barney Rubble"]),
        Trivia(q: "What is lost in Hawaiian and is also the name of a little girl in a 2002 film which features a alien named \"Stitch\"?", correct: "Lilo", incorrect: ["Lolo", "Lucy", "Lulu"]),
        Trivia(q: "In \"The Amazing World of Gumball\", who is the principal of Elmore Junior High?", correct: "Principal Brown", incorrect: ["Principal Small", "Principal Brawn", "Principal Simeon"]),
        Trivia(q: "In the show \"Steven Universe\", who are the main two employees of The Big Donut?", correct: "Sadie and Lars", incorrect: ["Steven and James", "Erik and Julie", "Bob and May"]),
        Trivia(q: "Which Teenage Mutant Ninja Turtle traditionally wears an orange bandana?", correct: "Michelangelo", incorrect: ["Leonardo", "Donatello", "Raphael"]),
        Trivia(q: "Who created the Cartoon Network series \"Regular Show\"?", correct: "J. G. Quintel", incorrect: ["Ben Bocquelet", "Pendleton Ward", "Rebecca Sugar"]),
        Trivia(q: "Who created \"RWBY\"?", correct: "Monty Oum", incorrect: ["Miles Luna", "Kerry Shawcross", "Shane Newville"]),
        Trivia(q: "What is Everest's favorite food in the Nickelodeon/Nick Jr. series \"PAW Patrol\"?", correct: "Liver", incorrect: ["Chicken", "Steak", "Caribou"]),
        Trivia(q: "In the show \"Foster's Home For Imaginary Friends\", which character had an obsession with basketball?", correct: "Wilt", incorrect: ["Coco", "Mac", "Cheese"]),
        Trivia(q: "Which of these characters from \"SpongeBob SquarePants\" is not a squid?", correct: "Gary", incorrect: ["Orvillie", "Squidward", "Squidette"]),
        Trivia(q: "In \"Gravity Falls\", the character Bill Cipher remarks that \"the universe is what?\"", correct: "A hologram ", incorrect: ["An illusion ", "A simulation", "Corrupting"]),
        Trivia(q: "Adam West was the mayor of which cartoon town?", correct: "Quahog", incorrect: ["Springfield", "South Park", "Langley Falls"]),
        Trivia(q: "In \"The Simpsons\", where did Homer and Marge first meet?", correct: "At Summer Camp", incorrect: ["At High School", "At Church", "At 742 Evergreen Terrace"]),
        Trivia(q: "In \"Rick and Morty\", from which dimension do Rick and Morty originate from?", correct: "C-137", incorrect: ["J1977", "C-136", "C500-a"]),
        Trivia(q: "In \"My Little Pony: Friendship is Magic\", which of these ponies represents the quality of honesty?", correct: "Applejack", incorrect: ["Twilight Sparkle", "Pinkie Pie", "Rarity"]),
        Trivia(q: "What is Dipper's real name from \"Gravity Falls\"?", correct: "Mason Pines", incorrect: ["Mable Pines", "Jason Pines", "Mark Pines"]),
        Trivia(q: "In \"Gravity Falls\", how much does Waddles weigh when Mable wins him in \"The Time Traveler's Pig\"?", correct: "15 pounds", incorrect: ["20 pounds", "10 pounds", "30 pounds"]),
        Trivia(q: "Which of these characters live in a pineapple under the sea in the cartoon \"SpongeBob SquarePants\".", correct: "SpongeBob SquarePants ", incorrect: ["Patrick Star", "Squidward Tentacles", "Mr. Krabs"]),
        Trivia(q: "How many episodes were in season five of Samurai Jack?", correct: "10", incorrect: ["12", "11", "13"]),
        Trivia(q: "What was the number on Gerald's shirt in \"Hey Arnold!\"?", correct: "33", incorrect: ["88", "38", "83"]),
        Trivia(q: "What is the name of the Alligator that The Simpsons \"killed\" in the episode \"Kill The Alligator and Run\"?", correct: "Captain Jack", incorrect: ["Captain Jake", "Captain Hector", "Captain Flynn"]),
        Trivia(q: "Benny, Brain, Fancy-Fancy, Spook and Choo-Choo were known associates of what Hanna Barbera cartoon character?", correct: "Top Cat", incorrect: ["Yogi Bear", "Snagglepuss", "Scooby-Doo"]),
        Trivia(q: "In the 1969 Cartoon show \"Dastardly and Muttley in Their Flying Machines\", which were NOT one of the lyrics in the opening theme?", correct: "Stab him", incorrect: ["Nab him", "Jab him", "Tab him"]),
        Trivia(q: "Who voiced Finn in Adventure Time?", correct: "Jeremy Shada", incorrect: ["Nolan North", "John DiMaggio", "Tom Kenny"]),
        Trivia(q: "What animated internet character is known to answer emails with his boxing gloves?", correct: "Strong Bad", incorrect: ["Strong Sad", "Strong Mad", "Strong Glad"]),
        Trivia(q: "Wendy O. Koopa appeared in the Super Mario DIC Cartoons, but what was she known as?", correct: "Kootie Pie", incorrect: ["Sweetie Pie", "Wendy Pie", "Honey Pie"]),
        Trivia(q: "What is the name of Ruby Rose's weapon from RWBY?", correct: "Crescent Rose", incorrect: ["Thorned Rosebud", "Magnhild", "Crooked Scythe"]),
        ],
        ]

    } */

}

