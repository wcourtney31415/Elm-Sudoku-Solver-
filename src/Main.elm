module Main exposing (..)

import Array exposing (..)
import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import Sudoku exposing (..)
import SudokuVisualComponents exposing (..)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


myPuzzle : Puzzle
myPuzzle =
    [ [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]
    , [ 9, 10, 11, 12, 13, 14, 15, 16, 17 ]
    , [ 18, 19, 20, 21, 22, 23, 24, 25, 26 ]
    , [ 27, 28, 29, 30, 31, 32, 33, 34, 35 ]
    , [ 36, 37, 38, 39, 40, 41, 42, 43, 44 ]
    , [ 45, 46, 47, 48, 49, 50, 51, 52, 53 ]
    , [ 54, 55, 56, 57, 58, 59, 60, 61, 62 ]
    , [ 63, 64, 65, 66, 67, 68, 69, 70, 71 ]
    , [ 72, 73, 74, 75, 76, 77, 78, 79, 80 ]
    ]


init : Model
init =
    { puzzle = myPuzzle
    }


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html.Html Msg
view model =
    Element.layout []
        (Element.column
            [ centerX
            , spacing 20
            , padding 100
            ]
            [ Element.el
                [ Font.size 40
                , centerX
                , Font.bold
                ]
                (text "Sudoku Solver")
            , puzzleToUi model.puzzle
            , Element.el
                [ Background.color <| rgb255 225 225 225
                , centerX
                ]
              <|
                Element.el
                    [ padding 15 ]
                    (text "Click here to solve!")
            ]
        )
