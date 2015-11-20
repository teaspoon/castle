module Castle where

import Html exposing (ul, li, text)
import Html.Attributes exposing (class)

main =
  view init

-- MODEL

type alias Book =
  { isbn : String
  , title : String
  , genre : String
  , author : String
  , word_count : Int
  , pages : Int
  , status : String
  }

type alias Model =
  List Book

init =
  [ {isbn = "978-0575097360", title = "The Way of Kings Part One", genre = "Fantasy", author = "Brandon Sanderson", word_count = 200000, pages = 608, status = "Currently Reading"}
  , {isbn = "978-0575102484", title = "The Way of Kings Part Two", genre = "Fantasy", author = "Brandon Sanderson", word_count = 187000, pages = 585, status = "Up Next"}
  , {isbn = "978-0575081406", title = "The Name of the Wind (The Kingkiller Chronicle)", genre = "Fantasy", author = "Patrick Rothfuss", word_count = 259000, pages = 672, status = "Completed"}
  ]

-- VIEW

view model =
  ul [ class "books" ] (List.map bookItem model)

bookItem book =
  li [ class "book" ] [ text book.title ]
