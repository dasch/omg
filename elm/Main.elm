import Html.App

import Model
import View
import Update


main =
  Html.App.beginnerProgram
    { model = Model.init
    , update = Update.update
    , view = View.view
    }
