module Castle where

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import StartApp
import Effects exposing (Effects, Never)
import Task exposing (Task)
import Json.Decode as Json exposing((:=))

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
  ([], fetchBooks)

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
    SetBooks books ->
      let
        newModel = Maybe.withDefault model, books
      in
        (newModel, Effects.none)


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

-- EFFECTS

fetchBooks : Effects Action
fetchBooks =
  Http.get decodeBooks "http://localhost:4000/api/books"
    |> Task.toMaybe
    |> Task.map SetBooks
    |> Effects.task

decodeBooks : Json.Decoder Model
decodeBooks =
  let
    book =
      Json.object2 ("isbn" := Json.string)
      Json.object2 ("title" := Json.string)
      Json.object2 ("genre" := Json.string)
      Json.object2 ("author" := Json.string)
      Json.object2 ("status" := Json.string)
      Json.object2 ("wordCount" := Json.string)
      Json.object2 ("pages" := Json.string)
  in
    Json.at ["data"] (Json.list book)
