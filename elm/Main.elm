import Html
import Html.App
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput, onClick)


main =
  Html.App.beginnerProgram
    { model = init
    , update = update
    , view = view
    }


type alias Message = String


type alias Model =
  { messages : List Message
  , entry : String
  }


init =
    { messages = [], entry = "" }


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


update msg model =
  case msg of
    NoOp ->
      model

    SetEntry entry ->
      { model | entry = entry }

    Send ->
      { model | entry = "", messages = model.entry :: model.messages }
