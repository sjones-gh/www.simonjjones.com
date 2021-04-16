module Main exposing (..)
import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Inc | Dec | BigInc | BigDec | Squared | Zero

update msg model =
  case msg of
    Inc ->
      model + 1
    BigInc ->
      model + 5
    Dec ->
      model - 1
    BigDec ->
      model - 5
    Squared ->
      model * model
    Zero ->
      0

view model =
  div []
    [
      div [] [ button [ onClick Inc ] [ text "+" ] ],
      div [] [ button [ onClick BigInc ] [ text "++" ] ],
      div [] [ button [ onClick BigDec ] [ text "--" ] ],
      div [] [ button [ onClick Dec ] [ text "-" ] ],
      div [] [ button [ onClick Squared ] [ text "^2" ] ],
      div [] [ button [ onClick Zero ] [ text "0" ] ],
      div [] [ text (String.fromInt model) ]
    ]
