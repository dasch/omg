module Update exposing (init, update, subscriptions, Msg(..))


import WebSocket

import Model exposing (Model)


type Msg = NewMessage String | Input String | Send


socketUrl =
  "ws://localhost:4567/"


init : Cmd Msg
init =
    Cmd.none


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Input entry ->
      ({ model | entry = entry }, Cmd.none)

    Send ->
      ({ model | entry = "" }, sendMessageCmd model.entry)

    NewMessage message ->
      ({ model | messages = message :: model.messages }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  WebSocket.listen socketUrl NewMessage


sendMessageCmd entry =
  WebSocket.send socketUrl entry
