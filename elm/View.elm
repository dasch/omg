module View exposing (view)


import Html exposing (Html, div, text, button)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput, onClick)

import Model exposing (Model)
import Update exposing (Msg(Input, Send))


view : Model -> Html Msg
view model =
  let
      messages =
        List.map viewMessage model.messages
          |> List.reverse

      viewMessage message =
        div [] [text message]

      input =
          div []
            [ Html.input
                [ placeholder "Text"
                , onInput Input
                , value model.entry
                ]
                []
            , button [onClick Send] [text "Send"]
            ]
  in
      div []
        [ div [] messages
        , div [] [input]
        ]
