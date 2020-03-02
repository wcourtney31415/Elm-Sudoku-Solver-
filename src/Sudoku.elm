module Sudoku exposing (..)

import Array exposing (..)


aPuzzle : Puzzle
aPuzzle =
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


getRow : Puzzle -> Int -> List Int
getRow puzzle row =
    Maybe.withDefault [ 0 ] (get row (fromList puzzle))


getColumn : Puzzle -> Int -> List Int
getColumn puzzle column =
    let
        row =
            1

        list =
            []
    in
    recursion puzzle row column list


recursion : Puzzle -> Int -> Int -> List Int -> List Int
recursion puzzle row column list =
    let
        newList =
            list ++ [ getAnElement puzzle row column ]
    in
    if not (row <= 9) then
        list

    else
        recursion puzzle (row + 1) column newList


getAnElement : Puzzle -> Int -> Int -> Int
getAnElement puzzle row column =
    let
        adjustedRow =
            row - 1

        adjustedColumn =
            column - 1

        selectedRow =
            getRow puzzle adjustedRow

        selectedElement =
            Array.get adjustedColumn (fromList selectedRow)
    in
    Maybe.withDefault 0 selectedElement


type alias Puzzle =
    List (List Int)


solvePuzzle : Puzzle -> Puzzle
solvePuzzle puzzle =
    puzzle
