module View exposing (view)


import Html exposing (Html, div, text, button)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput, onClick)
import Json.Decode

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
                , onEnter Send
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


onKeyDown : Int -> msg -> Html.Attribute msg
onKeyDown keycode msg =
  let
      decoder =
        Html.Events.keyCode `Json.Decode.andThen` checkKeyCode

      checkKeyCode kc =
        if kc == keycode then Json.Decode.succeed msg else Json.Decode.fail "No the right keycode"
  in
      Html.Events.on "keydown" decoder


onEnter : msg -> Html.Attribute msg
onEnter =
  onKeyDown 13
