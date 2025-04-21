class_name NameGenerator
extends Node



static var _first_names: Array[String] = [
    "Sierra", "Ari", "Imogen", "Talin", "Starry", "Ben", "Winter", "Sky",
    "Toby", "Chloe", "Xero", "Lou", "Bella", "Martyn", "Duke", "Holly",
    "Albion", "Seraph", "Fe'rynn", "De'vah", "Prym", "Vel", "Rahtt", "Junior",
    "Toby", "Sullivan", "Ogilvie", "Miles", "Ivo", "Amy", "Maria", "Gerald",
    "Silver", "Blaze", "Chip", "Sage", "Dexter", "Debra", "Angel", "Harrison",
    "Hannah", "Rita", "Joey", "Brian", "Beck", "Ainsley", "Ambrose", "Kai",
    "Ezra", "Levi", "Sage", "Elara", "Zane", "Ivy", "Finn", "Lyra", "Noah",
    "Mira", "Reed", "Vera", "Rowan", "Asher", "Hazel", "Dane", "Wren", "Aiden",
    "Bryn", "Owen", "Zara", "Rory", "Ember", "Xander", "Mae", "Orion", "Elise",
    "Mara", "Cass", "Emmy", "Sol", "Felix", "Jade", "Finnley", "Aria", "Gray",
    "Reese", "Blaire", "Cleo", "Nova", "Dylan", "Ruby", "Axel", "Wynn", "Zeke",
    "Jax", "Kira", "Skylar", "Eden", "Quinn", "Ivo", "Raine", "Blake", "Mira",
    "Eli", "Caden", "Nyla", "Talia", "Soren", "Violet", "Cyrus", "Nico",
    "Lucia", "Rhys", "Zola", "Finnian", "Anya", "Wade", "Isla", "Jasper",
    "Opal", "Callum", "Alina", "Gale", "Ember", "Remy", "Haven", "Seth",
    "Eira", "Sloane", "Archer", "Livia", "Beau", "Elle", "Colt",  "Nina", "Joel",
    "Tessa", "Caleb", "Lena", "Grant", "Milo", "Freya", "Theo", "June", "Emil",
    "Layla", "Gavin", "Irene", "Victor", "Maya", "Logan", "Elsie", "Andre",
    "Noelle", "Ronan", "Clara", "Jude", "Taryn", "Malik", "Dara", "Elias",
    "Sadie", "Omar", "Gia", "Corin", "Nadia", "Hugo", "Maren", "Quincy", "Dana",
    "Adrian", "Sylvie", "Reid", "Tina", "Julius", "Nell", "Samir", "Lara",
    "Basil", "Kara", "Enzo", "Petra", "Colin", "Rhea", "Dario", "Mina",
    "Harvey", "Lila", "Clark", "Taliah", "Frank", "Esme", "Neal", "Bianca",
    "Louis", "Anika", "Roger", "Celine", "Terrence", "Marcy", "Salim", "Joelle",
    "Curtis", "Nora", "Damien", "Faye", "Winston", "Amira", "Desmond",
    "Lucille", "Edgar", "Tami", "Jared", "Nicolette", "Russell", "Zina",
    "Alvin", "Greta", "Derrick", "Celeste", "Ray", "Dina", "Bernard", "Lumi",
    "Trent", "Helena", "Marvin", "Tori", "Gordon", "Lilith", "Hugh", "Simone",
    "Ewan", "Lorelai", "Trevor", "Anya", "Bruce", "Naomi", "Clint", "Ida",
    "Warren", "Mavis", "Daryl", "Yara", "Gilbert", "Tess", "Jorge", "Ines",
    "Donovan", "Rina", "Stuart", "Aviva", "Alistair", "Sabine"
    ]

static var _last_names: Array[String] = [
    "Kemp", "Kendrick", "Waverly", "Bennett", "Montgomery", "Sullivan",
    "Whitaker", "Hart", "Sinclair", "Everett", "Morrison", "Lennox", "Fletcher",
    "Carson", "Ainsley", "Kerrigan", "Thorne", "Brighton", "Donovan", "Hale",
    "Faulkner", "Griffith", "Langley", "Sterling", "Reynolds", "Ellis",
    "Shepard", "Caldwell", "Hayes", "Larkin", "Prescott", "Vance", "Holland",
    "Blackwood", "Sawyer", "Brooks", "Lancaster", "Winters", "Harper", "Frost",
    "Carver", "Harrington", "Lockwood", "Greene", "Stone", "Wilder", "Summers",
    "Rowe", "Lowe", "Beaumont", "Hendrix", "Maddox", "Chandler", "Delaney",
    "Merritt", "Rivers", "Foster", "Cross", "Ashford", "Barrett", "Radcliffe",
    "Parker", "Ellington", "North", "Garrison", "Wallace", "Coleman", "Turner",
    "West", "Langston", "Ferguson", "Maxwell", "Holloway", "Bishop", "Blake",
    "Winslow", "Carter", "Manning", "Channing", "Ford", "Beckett", "Porter",
    "Hudson", "Tate", "Armstrong", "Bauer", "Ellison", "Drake", "Vaughn",
    "Pierce", "Sutton", "Fitzgerald", "Cole", "Hayward", "Reese", "Quinn",
    "Dalton", "Ashcroft", "Leighton", "Steele", "Hawkins", "Kingston", "Wells",
    "Fletcher", "Knight", "Jameson", "Morgan", "Ravenwood", "Goldtalon",
    "Silkwind", "Hollow", "Gardenclaw", "Redthorn", "Grayhome", "Tenderheart",
    "Tenderhome", "Grayheart", "Bryant", "Nash", "Douglas", "Jennings",
    "Abbott", "Spencer", "Clayton", "Rayner", "Crosby", "Hampton", "Lawson",
    "Pratt", "Baldwin", "Milton", "Granger", "Stevens", "Tanner", "Peters",
    "Whitman", "Brennan", "Daley", "Sharpe", "Connelly", "Gaines", "Rowland",
    "Jefferson", "Atwood", "Harmon", "Boone", "Stafford", "Ingram", "Walton",
    "Nolan", "Benson", "Marsh", "Hobbes", "Crane", "Sanders", "Franklin",
    "Thorpe", "Hewitt", "Paxton", "Lowell", "Andrews", "Mayer", "Barton",
    "Payne", "Hatcher", "Kirby", "Dawson", "Webster", "Reeves", "Chambers",
    "Abbey", "Morton", "Gibson", "Brady", "Finch", "Jarvis", "Hutchins",
    "Mercer", "Barron", "Riggs", "Benson", "Quimby", "Lang", "Bates",
    "Whitmore", "Greaves", "Thornton", "Chapman", "Rowley", "Denton", "Stanley",
    "Barker", "Hurst", "Clemons", "Keaton", "Pruitt", "Hensley", "Travis",
    "Merrill", "Compton", "Donahue", "Adler", "Shelton", "Neville", "Farley"
]

static var _title_words: Array[String] = [
    "Covenant", "Raven", "Pursuit", "Lighthouse", "Coterie", "Fox", "Heart",
    "Silent", "Dream", "Event", "Horizon", "He", "She", "They", "It", "Red",
    "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet", "Win", "Lose",
    "Time", "Space", "War", "Peace", "Rise", "Fall", "Light", "Dark", "Shadow",
    "Sun", "Death", "Life", "Murder", "Heal", "Pot", "Pan", "Kitchen", "Living",
    "Room", "Bathroom", "Roof", "House", "Balcony", "Woods", "Day", "Night",
    "Blood", "Bloody", "Lake", "River", "Starling", "Maid", "Devil", "Die",
    "Marble", "Hill", "Zone", "Chemical", "Plant", "Sky", "Sanctuary", "Egg",
    "Man", "Woman", "Person", "Son", "Daughter", "Child", "Sister", "Brother",
    "Sibling", "Riot", "Protest", "Political", "President", "Speech", "Jump",
    "Guitar", "Violin", "Piano", "Drugs", "Hopsital", "Floor", "Jail", "Police",
    "Mansion", "Cave", "Lantern", "Spooky", "Ghost", "Witch", "Samhain", "Oak",
    "Tree", "Computer", "Phone", "Text", "Call", "Record", "Program", "CIA",
    "Monkey", "Lion", "Tiger", "Blur", "Run", "Homing", "Attack", "Pirate",
    "Sail", "Ice", "Fire", "Grass", "Water", "Air", "Earth", "Planet", "Sword",
    "Shield", "King", "Queen", "Ruler", "Lord", "Emperor", "Empress", "Gender",
    "Binary", "Stupid", "Damn", "Hell", "Crap", "Flower", "Mouse", "Code",
    "Game", "Freak", "Wall", "Giant", "Porter", "Population", "Copyright",
    "Drift", "Shallow", "Period", "Loop", "Observation", "Sensation", "Vain",
    "Snake", "Consideration", "Abbey", "Basic", "Prison", "Announcement",
    "Agreement", "Behead", "Spy", "Deadly", "Computing", "Forecast", "Point",
    "Normal", "Sport", "Fireplace", "Haunt", "Prosper", "Dealer", "Taste",
    "Conversation", "Revive", "Village", "Generation", "Dinner", "Insect",
    "Insert", "Glow", "Tumble", "Rough", "Add", "Band", "Plaintiff", "Compose",
    "Money", "Strange", "Incentive", "College", "Judge", "Clinic", "Preach",
    "Section", "Writer", "Agony", "Help", "Elect", "Accurate", "Illness",
    "Doll", "Ballot", "Second", "Fade", "Seal", "Hobby", "Punish", "Cry",
    "Characteristic", "Franchise", "Turkey", "Baby", "Elegant", "Mobile",
    "Cottage", "Ivory", "Interface", "Extreme", "Mark", "Latest", "Sympathetic",
    "Perform", "Jacket", "Barrel", "Dog", "Breed", "Sacrifice", "Repetition",
    "Berry", "Row", "Character", "Tight", "Sick", "Cool", "Sweet", "Stool",
    "Facade", "Government", "Rear", "Matter", "Work", "Commission",
    "Population", "Fairy", "Appetite", "Hunger", "Thirst", "Pickaxe", "Shovel",
    "Chicken", "Jockey", "Lava", "Bucket", "Flint", "Steel", "Dirt", "Block"
]

static var _formats: Array[String] = [
        "The {X} of {Y}",
        "{X}, {Y}, and {Z}",
        "{X} with {Y}",
        "{X} of the {Y}",
        "{X}",
        "The {X}",
        "In the {X} of {Y}",
        "{X}'s {Y}",
        "The {X} and the {Y}",
        "{X}: {Y}",
        "The {X} of {Y} and {Z}",
        "{X} and {Y}",
        "{X} in {Y}",
        "On the {X} of {Y}",
        "The {X}, the {Y}, and the {Z}",
        "The {X} in the {Y}",
        "How {X} Became {Y}",
        "In the {X} of {Y} and {Z}",
        "The {X} on the {Y}",
        "The {X} of {Y} {Z}",
        "Because of {X}",
        "For {X}",
        "Dear {X}",
        "Into {X}",
        "{X} for {Y}",
        "After {X}",
        "Before {X}",
        "{X} 101",
        "{X} Compendium",
        "Beginner's Guide to {X}",
        "The {X} of the {Y}",
        "This is {X}",
        "How {X} and {Y} Make {Z}",
        "{X}ology"
    ]

static func generate_name() -> String:
    return _first_names.pick_random() + " " + _last_names.pick_random()
    
    
static func generate_title() -> String:
    var format = _formats.pick_random()

    # Randomly grab up to 3 words
    var x = _title_words.pick_random()
    var y = _title_words.pick_random()
    var z = _title_words.pick_random()

    # Replace placeholders
    var title = format.replace("{X}", x)
    title = title.replace("{Y}", y)
    title = title.replace("{Z}", z)

    return title
