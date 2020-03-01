module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type Msg
    = SomeKindOfUpdate


type alias Model =
    { myString : String }


init : Model
init =
    { myString = "Hello, world!" }


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html.Html Msg
view model =
    Element.layout []
        (Element.column
            []
            [ Element.el [] (text model.myString) ]
        )
