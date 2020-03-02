module Main exposing (..)

import Array exposing (..)
import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import Sudoku exposing (..)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type Msg
    = SomeKindOfUpdate


type alias Model =
    { myString : String
    , aPuzzle : Puzzle
    }


init : Model
init =
    { myString = "Hello, world!"
    , aPuzzle = aPuzzle
    }


update : Msg -> Model -> Model
update msg model =
    model



--map sqrt (fromList [1,4,9])


view : Model -> Html.Html Msg
view model =
    Element.layout []
        (Element.column
            []
            [ Element.el [] (text "Yep")
            , Element.el [] (text model.myString)
            , Element.el [] (text <| String.fromInt <| getAnElement model.aPuzzle 4 6)
            , Element.el [] (text <| "Column " ++ String.fromInt 3 ++ ": ")
            , Element.el [] (text <| lstIntTolstString <| getColumn model.aPuzzle 6)
            , Element.el [] (text <| "Row " ++ String.fromInt 4 ++ ": ")
            , Element.el [] (text <| lstIntTolstString <| getRow model.aPuzzle 4)
            ]
        )


lstIntTolstString : List Int -> String
lstIntTolstString listOfInts =
    String.join ", " <| List.map String.fromInt listOfInts
