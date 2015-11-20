module Castle where

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import StartApp
import Effects exposing (Effects, Never)
import Task exposing (Task)

app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = []
    }

main : Signal Html
main =
  app.html

port tasks : Signal (Task Never())
port tasks =
  app.tasks

-- MODEL

type alias Book =
  { isbn : String
  , title : String
  , genre : String
  , author : String
  , wordCount : Int
  , pages : Int
  , status : String
  }

type alias Model =
  List Book

init : (Model, Effects Action)
init =
  let
    books =
      [ {isbn = "978-0575097360", title = "The Way of Kings Part One", genre = "Fantasy", author = "Brandon Sanderson", word_count = 200000, pages = 608, status = "Currently Reading"}
      , {isbn = "978-0575102484", title = "The Way of Kings Part Two", genre = "Fantasy", author = "Brandon Sanderson", word_count = 187000, pages = 585, status = "Up Next"}
      , {isbn = "978-0575081406", title = "The Name of the Wind (The Kingkiller Chronicle)", genre = "Fantasy", author = "Patrick Rothfuss", word_count = 259000, pages = 672, status = "Completed"}
      ]
  in
    (books, Effects.none)


-- UPDATE

type Action = Toggle Book

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Toggle bookToToggle ->
      let
        updateBook bookFromModel =
          if bookFromModel.isbn == bookToToggle.isbn then
            if bookToToggle.status == "Up Next" then
              { bookFromModel | status = "Currently Reading" }
            else
              { bookFromModel | status = "Completed" }
          else bookFromModel
      in
        (List.map updateBook model, Effects.none)


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  ul [ class "books" ] (List.map (bookItem address) model)

bookItem : Signal.Address Action -> Book -> Html
bookItem address book =
  li
    [ class "book"
    , onClick address (Toggle book)]
    [ text book.title, text " ", text book.status ]
