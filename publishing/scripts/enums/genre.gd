class_name Genre
extends RefCounted

enum {
    PHILOSOPHY,
    RELIGION,
    SOCIAL_SCIENCES,
    LANGUAGE,
    SCIENCE,
    TECHNOLOGY,
    ARTS,
    LITERATURE,
    HISTORY,
    GEOGRAPHY,
    BIOGRAPHY,
    SCIENCE_FICTION,
    FANTASY,
    MYSTERY,
    ROMANCE,
    THRILLER,
    COMEDY,
    HORROR,
    SLICE_OF_LIFE,
    HISTORICAL_FICTION,
    CONTEMPORARY_FICTION,
    LITERARY_FICTION,
}

const GENRES_START = PHILOSOPHY
const GENRES_END = LITERARY_FICTION

static func get_genre_name(genre: int) -> String:
    match genre:
        PHILOSOPHY:
            return "Philosophy"
        RELIGION:
            return "Religion"
        SOCIAL_SCIENCES:
            return "Social Sciences"
        LANGUAGE:
            return "Language"
        SCIENCE:
            return "Science"
        TECHNOLOGY:
            return "Technology"
        ARTS:
            return "Arts"
        LITERATURE:
            return "Literature"
        HISTORY:
            return "History"
        GEOGRAPHY:
            return "Geography"
        BIOGRAPHY:
            return "Biography"
        SCIENCE_FICTION:
            return "Science Fiction"
        FANTASY:
            return "Fantasy"
        MYSTERY:
            return "Mystery"
        ROMANCE:
            return "Romance"
        THRILLER:
            return "Thriller"
        COMEDY:
            return "Comedy"
        HORROR:
            return "Horror"
        SLICE_OF_LIFE:
            return "Slice of Life"
        HISTORICAL_FICTION:
            return "Historical Fiction"
        CONTEMPORARY_FICTION:
            return "Contemporary Fiction"
        LITERARY_FICTION:
            return "Literary Fiction"
        _:
            return "Unknown Genre"
