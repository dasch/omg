import Html
import Html.App
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput, onClick)

import Model
import Update exposing (Msg(SetEntry, Send))


main =
  Html.App.beginnerProgram
    { model = Model.init
    , update = Update.update
    , view = view
    }


view model =
  let
      messages =
        List.map viewMessage model.messages
          |> List.reverse

      viewMessage message =
        Html.div [] [Html.text message]

      input =
          Html.div []
            [ Html.input
                [ placeholder "Text"
                , onInput SetEntry
                , value model.entry
                ]
                []
            , Html.button [onClick Send] [Html.text "Send"]
            ]
  in
      Html.div []
        [ Html.div [] messages
        , Html.div [] [input]
        ]
