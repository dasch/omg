module Model exposing (Model, init)


type alias Model =
  { messages : List String
  , entry : String
  }


init =
    { messages = [], entry = "" }


