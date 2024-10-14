extends Node


var _first_names = [
    "Sierra", "Ari", "Imogen", "Talin", "Starry", "Ben", "Winter", "Sky",
    "Graham", "Chloe", "Xero", "Lou", "Bella", "Martyn", "Duke", "Holly",
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
    "Eira", "Sloane", "Archer", "Livia", "Beau", "Elle", "Colt"
    ]

static var _last_names = [
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
    "Tenderhome", "Grayheart"
]

var _title_words = [
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
    "Game", "Freak",
]

func get_first_names():
    return _first_names
    
    
func get_last_names():
    return _last_names
    
    
func get_title_words():
    return _title_words
