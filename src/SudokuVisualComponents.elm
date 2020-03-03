module SudokuVisualComponents exposing (..)

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


spacer =
    let
        size =
            10
    in
    Element.el
        [ width
            (fill
                |> maximum size
                |> minimum size
            )
        , height
            (fill
                |> maximum size
                |> minimum size
            )
        , Background.color <| rgb255 255 0 0
        , centerX
        , centerY
        ]
        (text " ")


listOfRows : Puzzle -> Int -> List (Element Msg) -> List (Element Msg)
listOfRows puzzle counter list =
    if counter > 8 then
        List.reverse list

    else if modBy 3 counter == 0 then
        let
            listWithSpacer =
                spacer :: list
        in
        listOfRows puzzle (counter + 1) (rowToUiRow puzzle counter :: listWithSpacer)

    else
        listOfRows puzzle (counter + 1) (rowToUiRow puzzle counter :: list)


puzzleToUi : Puzzle -> Element Msg
puzzleToUi puzzle =
    Element.column [ spacing 5 ] <|
        listOfRows puzzle 0 []


addRowSpacers : Array (Element Msg) -> Int -> Array (Element Msg)
addRowSpacers arrayOfUIs counter =
    if Debug.log "counter: " counter < 9 then
        arrayOfUIs

    else if modBy 3 counter == 0 then
        let
            firstPortion =
                Array.slice 0 counter arrayOfUIs

            lastPortion =
                Array.slice (counter + 1) (Array.length arrayOfUIs) arrayOfUIs

            spacerAsList =
                fromList [ spacer ]

            firstAndMid =
                Array.append firstPortion spacerAsList

            arrayWithNewSpace =
                Array.append firstAndMid lastPortion
        in
        addRowSpacers arrayWithNewSpace (counter + 1)

    else
        addRowSpacers arrayOfUIs (counter + 1)


rowToUiRow : Puzzle -> Int -> Element Msg
rowToUiRow puzzle row =
    let
        selectedRow : List Int
        selectedRow =
            getRow puzzle row

        arrayOfStrings : Array String
        arrayOfStrings =
            Array.map String.fromInt (fromList selectedRow)

        arrayOfUIs : Array (Element Msg)
        arrayOfUIs =
            Array.map stringToUi arrayOfStrings

        listOfUIs : List (Element Msg)
        listOfUIs =
            toList <| addRowSpacers arrayOfUIs 0
    in
    Element.row [ spacing 5 ] listOfUIs


stringToUi : String -> Element Msg
stringToUi str =
    let
        myText =
            Element.el
                [ padding 8
                , centerX
                , centerY
                ]
                (text str)
    in
    Element.el
        [ Background.color <| rgb255 214 214 214
        , width
            (fill
                |> maximum 32
                |> minimum 32
            )
        ]
        myText
