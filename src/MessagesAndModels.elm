module MessagesAndModels exposing (..)

import Sudoku exposing (..)


type Msg
    = SomeKindOfUpdate


type alias Model =
    { puzzle : Puzzle
    }
