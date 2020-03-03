module Sudoku exposing (..)

import Array exposing (..)
import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html


lstIntTolstString : List Int -> String
lstIntTolstString listOfInts =
    String.join ", " <| List.map String.fromInt listOfInts


getRow : Puzzle -> Int -> List Int
getRow puzzle row =
    Maybe.withDefault [ 0 ] (get row (fromList puzzle))


type alias Puzzle =
    List (List Int)
