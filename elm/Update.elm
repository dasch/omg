module Update exposing (init, update, subscriptions, Msg(..))


import Model exposing (Model)


type Msg = Input String | Send


init : Cmd Msg
init =
    Cmd.none


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Input entry ->
      ({ model | entry = entry }, Cmd.none)

    Send ->
      ({ model | entry = "", messages = model.entry :: model.messages }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
