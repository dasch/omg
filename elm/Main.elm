import Html
import Html.App
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput, onClick)

import Model


main =
  Html.App.beginnerProgram
    { model = Model.init
    , update = update
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


type Msg = NoOp | SetEntry String | Send


update : Msg -> Model.Model -> Model.Model
update msg model =
  case msg of
    NoOp ->
      model

    SetEntry entry ->
      { model | entry = entry }

    Send ->
      { model | entry = "", messages = model.entry :: model.messages }
