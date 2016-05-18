module Update exposing (update, Msg(SetEntry, Send))


import Model exposing (Model)


type Msg = NoOp | SetEntry String | Send


update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp ->
      model

    SetEntry entry ->
      { model | entry = entry }

    Send ->
      { model | entry = "", messages = model.entry :: model.messages }
